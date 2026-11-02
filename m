Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617047;
	b=AO9HdLpH/tgDO34HbcLsmSbHFkUEY+J1oh2BHWjCPhytgmpXA+qfUhZ7p7jwEF0c8Kqm
	 BPWvWpV2o4zIrugJPXVKWHihUoPYkaGfBd0+FzymHmGDV3VGagSI90U2jiVHvi+v/M1Dq
	 smMea9XqAhmC+L0KZeMofsCr+cTf17VCIRAUEJrLdSKumoLSr1gNpH9ad0rJ9KCTBOfzE
	 FobcQ672Q523EhMJjNzndNErvMtkm7m6Rg3OGUO77VUu0roIx15gClFnXjGAtqUF/HOO5
	 rvl9FSK0s7B8NCkLNbW1ERFD0x/wiiE9YgE6/ndhqWtr8iuEoMVP+Grdevt0fv/dFPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=MEFT/ALM9DZEMfY5C0sSExRjEKJeRSawG9RBT+Nn+N0=;
	b=bNa/D6mPj5dYrHSHhZ3xkO6pSRAnbClRd1KG1WuycNIsR45QhB+fu8waaiGhR6k3iguv
	 MFFiIIiCuSir2gps71kT/FEo92Hzp8A3ZOxteQokg0ukjfU9dgZucZYMylgHAm7/Cv+0P
	 N/iILuPQXkVm+fv+y1FG4K18no1FE21CW5enLS86x618UNpB3hFSN5jiB80+F/wAtG6C6
	 HyA54IQ+RM/YZI8Evumu00NaV0dv6qcyRiGnACp25w9eq1f75MHCV28apjuHFWf6bhb2t
	 Ihovsv6VI6rl9X8bQFQKzaMhFhf4GPsH+LWlsPZeTVQgssdRlo/bzjpdY9FLdM7cQIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GjvqH4h9;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596D360A263A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596D360A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GjvqH4h9
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so36860905e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617046; x=1794221846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MEFT/ALM9DZEMfY5C0sSExRjEKJeRSawG9RBT+Nn+N0=;
        b=GjvqH4h9aGhgAoSu7Hb2JUpF6QSASqEQeq+hwqNF8rAdi4B1RGuYmTBOGlZaFM5lbb
         eZFlEKQ/Qc1bcKDNlP2XZ4KuWSH1kJJNmz3SJ0QbRgZ07MSeI9XX5vBeaxXV654ohujB
         B9C+DZ7RmSPqHVbWhoLWUJfcNThQnV/zCNq83jMLQXrhcI7+HmBeTuJ2onsCu/EvcfzV
         ZCdvzy1/n2iXENo9S7ydG3iGzMFSm0hC+p0++qyHZpXvYtvzLHYZ700+VMdttyQzDYFg
         KEflxHKonheMJhbqaiaAdaWrnEwK1hTdkgPSMJpfrvB7VV4kR6/6SIyh87R8AQPyFQFE
         ceYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617046; x=1794221846;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEFT/ALM9DZEMfY5C0sSExRjEKJeRSawG9RBT+Nn+N0=;
        b=OYXYsQuywObraNjVy50HKUqtZ/0ivbqeIPB2YD+gdCASWzuqZFuZgseH5t/Hi5Ifre
         bKuO9qLhN1zacPwhJPznoXxzv4IZea4yjMattVPczRtTYP9fLZG4aE3gxD9iaK8sOqCr
         ljAUL8B4kiQ2kZ4yYa+f0X7PTC0s3gd0d6dBlm7tyhU80M1NseWfqSRjx47b6/c2Jax8
         6KfcpSWX8WkqMgkp6U0OwnVlBk9GSQLFjZCH/I0+ZjmEff4CGrx03JiIMzh6iXiZbQs6
         UnItwU5mvrqEYcUtOMYi2XfolRxcfCNMIjoJ1TCoY3kY0rrGTBQEqhTrilj15hxIq5kN
         H26Q==
X-Gm-Message-State: AFq9FYKHLt+NmJYm7s+xcUFEY3szmcdkvMJ/uc+tGAAzp8KOyftyxVD3
	VIp2Y8Ww48P0ONL1KJVEGrtGlxA8sTzvX27e4G4thxwOh1bdJgsLh9WoXy96cIw21uwKIzmw5dZ
	Et24dKBo=
X-Gm-Gg: AYBFou1MRQpg+NeVoLpvOE9P27CduZ7t5vODP9LnrRzWm3BxKbVfAgry/M0FO3WWAgt
	79fEpXt/S7+JQ3Zd7H2T2dpAStTUrzem76jUbGVSvaWNclpDyLy067tFCSR/07OCzQGmAOnlvmN
	7Jqxwdb8dCkOibGCm+eGXpWCj0D/TsNJCzmm5TRO/0vJUynrQ+pfulrnPdYlxHh4JEsx7rpqrdu
	TDKt/0Bm/vrg5Ml1GSmu5e2eBYG43Uk+AZD+3xPab9vi0WPMH8HfOvgGxNv+/TJfk805UTeaudo
	RVzDlNW3sLNZsU/tihZnAucWveFQfi9j8+xfPGG+2rfhIM7RdQQMww/yA7NlTf8Q5vanPR+5+qY
	hd8THwQWYX1MdXlACRQzTM4LvkCRqr069gQ9sZLWBWkzglYewnOZbjOmA777vJbVWioLrqrwW+F
	sC70WV+AzT+xcVwxp3AoXqff+dpfz0CH88rHB3Sa8BwfC6f4uxHts6Pc55TJoOBt9T9L3SnFd1O
	hMGt0qy7gG86gYiaUZp1wk21qLDiTRM0ZP+l5KN5MzQkFskhQkozk9JHyqVRKGs/LNkl18r40dR
	t70VR4ljZnxbvL0SjLQRFzbGJGwNsT433/IZqx3c3fJ5C+5gj1Bl
X-Received: by 2002:a05:600c:8b01:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ac16fa4f73mr235301845e9.8.1793617045755;
        Mon, 02 Nov 2026 02:57:25 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm363171175e9.1.2026.11.02.02.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:57:25 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Petko Manolov <petkan@nucleusys.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH net-next v5 5/6] net: usb: pegasus: Move long delayed work on system_dfl_long_wq
Date: Mon,  2 Nov 2026 11:56:55 +0100
Message-ID: <20261102105703.111844-6-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102105703.111844-1-marco.crivellari@suse.com>
References: <20261102105703.111844-1-marco.crivellari@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the code enqueues the carrier_check delayed work using
queue_delayed_work(), on system_long_wq. This workqueue should be used
when long works are expected and it is a per-cpu workqueue.

queue_delayed_work() ends up calling __queue_delayed_work(), which, since
the work is always queued with CARRIER_CHECK_DELAY, sets a global timer
that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since carrier_check doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: Petko Manolov <petkan@nucleusys.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/net/usb/pegasus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index 68e4b6658dd2..a4ecfec290b6 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -1126,8 +1126,9 @@ static void check_carrier(struct work_struct *work)
 	pegasus_t *pegasus = container_of(work, pegasus_t, carrier_check.work);
 	set_carrier(pegasus->net);
 	if (!(pegasus->flags & PEGASUS_UNPLUG)) {
-		queue_delayed_work(system_long_wq, &pegasus->carrier_check,
-			CARRIER_CHECK_DELAY);
+		queue_delayed_work(system_dfl_long_wq,
+				   &pegasus->carrier_check,
+				   CARRIER_CHECK_DELAY);
 	}
 }
 
@@ -1231,7 +1232,7 @@ static int pegasus_probe(struct usb_interface *intf,
 	res = register_netdev(net);
 	if (res)
 		goto out3;
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 			   CARRIER_CHECK_DELAY);
 	dev_info(&intf->dev, "%s, %s, %pM\n", net->name,
 		 info ? info->name : "(unknown)", net->dev_addr);
@@ -1296,7 +1297,7 @@ static int pegasus_resume(struct usb_interface *intf)
 		pegasus->intr_urb->actual_length = 0;
 		intr_callback(pegasus->intr_urb);
 	}
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 				CARRIER_CHECK_DELAY);
 	return 0;
 }
-- 
2.56.0

