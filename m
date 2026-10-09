Received: from ssl01.alldomains.hosting (ssl01.alldomains.hosting [213.145.224.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2239737FF76
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.145.224.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791589947; cv=none; b=YIZBwPvidvG82QptryWNRSs2Aywiqwq7EABlmHUaZUnWXqQb0pOuRY/0qvmVvEKmzRjsIVyLSTEzTh1rD+u9VS11EyJpScCefLQ143M/R9Q7UU4p0VMUvtt+cmdu1ELLWs6JE4E4GaFcjsijuvriDJUH4ravWb8MQHVW06LyZeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791589947; c=relaxed/simple;
	bh=ebnU1WDVM7H+Bg+SOCH5165cqGGSS5oLr0S5gsA3+eU=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=u+UVJaFvWogzNDoWRPf3mEjtMppCY5ts4lDbdJ3826DGdIQPNOkvGvA5oidbWLDVYoyhUi0pp5kP+ZTwAevn3MwOwmImWb+fyNKLXuRsYs+0HusISU+cjI1bzXMOYlQ/P9WPfo+S8q/kj+jP+HlJ/ZsC0kZd27XV6h5V/zPYdp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dittrich.top; spf=none smtp.mailfrom=dittrich.top; dkim=pass (2048-bit key) header.d=ssl01.alldomains.hosting header.i=@ssl01.alldomains.hosting header.b=LvGfq6IP; arc=none smtp.client-ip=213.145.224.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dittrich.top
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dittrich.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ssl01.alldomains.hosting header.i=@ssl01.alldomains.hosting header.b="LvGfq6IP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ssl01.alldomains.hosting; s=dkim; h=From:Sender:To:Cc:
	References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	Content-Language; bh=jlrehCtVYfO3G6hQE6eg6Itx+bK/RnGOlKLN7ylpNTQ
	=; b=LvGfq6IPgenjH32crku0yNNqC6y+9pG72HXoo/NBaITHN5LtB3t9IAejK1P
	EvW9mUF38FOscOYBnnQWmMVR834eIPrxmRz12jPeJPV00Zf1s9FLo1UsgmEghgDY
	9EvtHOYeDtTm4c4j3kyNPLjv0MH9RzDRLKHjt0fs1+kF5VnGiBYgv2R3kg8R0Ukq
	S4509gi3M5Y+UDp7lJmUUDlZS2smWFWwqexM+mlhPWvLhJDkYC/PGEciZLBv3rOi
	cn6h7S36Cd/i2v/ALN+JRUAF5QYVGOXNcFrIbO4Xxg6XVkS0QqqL8sBMhyJ9BH4g
	l88uLTTwt6yeubIsH3q5f1HGqaA==
Received: (qmail 1703242 invoked by uid 7799); 10 Oct 2026 01:45:40 +0200
Received: by simscan 1.4.0 ppid: 1703216, pid: 1703233, t: 0.0846s
         scanners: clamav: 1.4.3/m:63/d:28148
Received: from unknown (HELO ROG) (michael@dittrich.top@94.31.113.139) by ssl01.alldomains.hosting with SMTP [4863]; 10 Oct 2026 01:45:40 +0200
From: <linux-media@dittrich.top>
Sender: "Michael Dittrich" <michael@dittrich.top>
To: <linux-media@vger.kernel.org>
Cc: <mchehab@kernel.org>,
	<nibble.max@gmail.com>,
	<linux-kernel@vger.kernel.org>
References: 
In-Reply-To: 
Subject: [RFC PATCH v2] media: smipcie: validate DMA lengths and avoid stale work
Date: Sat, 10 Oct 2026 01:45:40 +0200
Message-ID: <041301dd5848$4af6c9c0$e0e45d40$@dittrich.top>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad1YQlcidfEawcyUSqGHVs4pTbRUcQ==
Content-Language: de

smi_dma_xfer() passes a register-derived length to the DVB demux without
checking it against the 192,512-byte DMA buffer. A zero register value
is interpreted as 4 MiB, allowing the demux to read beyond the buffer
if that completion is processed. Reject oversized lengths on both channels.

smi_start_feed() also unconditionally queues work without refreshing
_int_status. Clear the saved status and enable work before IRQ/DMA;
let a new IRQ queue the completion work.

A VDR 2.8.2 restart with two DVBSky S952 V3 cards caused a panic on
Debian 6.12.107-1 in the unmodified driver:
  RIP: dvb_dmx_swfilter_packets+0x5d/0x90 [dvb_core]
  Call Trace: smi_dma_xfer+0x154/0x210 [smipcie]
The exact IRQ sequence and DMA length at the crash were not captured,
so the connection to stale completion work remains a hypothesis.

Fixes: d32f9ff7376c ("[media] smipcie: SMI pcie bridge driver for DVBSky S950 V3 dvb-s/s2 cards")
Fixes: 1021dd010d21 ("media: Convert from tasklet to BH workqueue")
Reported-by: Michael Dittrich <linux-media@dittrich.top>
Closes: https://lore.kernel.org/r/000001dd4e71$a853ad30$f8fb0790$@dittrich.top
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch

Signed-off-by: Michael Dittrich <linux-media@dittrich.top>

---
v2: Correct the wrapped inline diff from the original report; code unchanged.

Base: media-committers next, checked on 10 October 2026:
d7e7bca7169873b46e857c025c10f3336c1258d8

The equivalent Debian fix passed ten VDR restarts and a reboot.
A stubbed test of the current source passed all 22-bit lengths on both
DMA channels and checked startup queuing/status. It does not test IRQ races.
Built on the above base as an x86_64 module with W=1 and section checks.
Sparse and Smatch found no smipcie diagnostics, as did the compiler.
The kernel build completed with warnings in unrelated, unchanged code.
No mainline hardware test or standalone mainline reproducer;
restart script and full trace are available to maintainers on request.

checkpatch --strict --no-signoff: one CHECK for existing finishedData;
retained to avoid unrelated renaming. AI assisted with source review,
the patch, tests and this message.

 drivers/media/pci/smipcie/smipcie-main.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/smipcie/smipcie-main.c b/drivers/media/pci/smipcie/smipcie-main.c
--- a/drivers/media/pci/smipcie/smipcie-main.c
+++ b/drivers/media/pci/smipcie/smipcie-main.c
@@ -310,8 +310,15 @@
 				"DMA CH0 engine complete length mismatched, finish data=%d !\n",
 				finishedData);
 		}
-		dvb_dmx_swfilter_packets(&port->demux,
-			port->cpu_addr[0], (finishedData / 188));
+		/* Reject lengths exceeding the DMA buffer. */
+		if (finishedData > SMI_TS_DMA_BUF_SIZE)
+			dev_warn_ratelimited(&dev->pci_dev->dev,
+					     "DMA CH0 invalid length %u, dropping completion\n",
+					     finishedData);
+		else
+			dvb_dmx_swfilter_packets(&port->demux,
+						 port->cpu_addr[0],
+						 finishedData / 188);
 		/*dvb_dmx_swfilter(&port->demux,
 			port->cpu_addr[0], finishedData);*/
 	}
@@ -333,8 +340,15 @@
 				"DMA CH1 engine complete length mismatched, finish data=%d !\n",
 				finishedData);
 		}
-		dvb_dmx_swfilter_packets(&port->demux,
-			port->cpu_addr[1], (finishedData / 188));
+		/* Reject lengths exceeding the DMA buffer. */
+		if (finishedData > SMI_TS_DMA_BUF_SIZE)
+			dev_warn_ratelimited(&dev->pci_dev->dev,
+					     "DMA CH1 invalid length %u, dropping completion\n",
+					     finishedData);
+		else
+			dvb_dmx_swfilter_packets(&port->demux,
+						 port->cpu_addr[1],
+						 finishedData / 188);
 		/*dvb_dmx_swfilter(&port->demux,
 			port->cpu_addr[1], finishedData);*/
 	}
@@ -821,9 +835,11 @@
 	if (port->users++ == 0) {
 		dmaManagement = smi_config_DMA(port);
 		smi_port_clearInterrupt(port);
+		/* Clear stale status; let the IRQ queue work. */
+		port->_int_status = 0;
+		enable_work(&port->bh_work);
 		smi_port_enableInterrupt(port);
 		smi_write(port->DMA_MANAGEMENT, dmaManagement);
-		enable_and_queue_work(system_bh_wq, &port->bh_work);
 	}
 	return port->users;
 }

