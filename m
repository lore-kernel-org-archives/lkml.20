Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485902;
	b=0ReI497mONuJOwRd3qaKFZ/wNC5kOiy6W8brnJBRlRUGkIAMwFkiI+WJR7OmESTEipfW
	 PXN4H6KEnQplO4J6vuQlHogx7qNP40SOQzw9WZ7MKaXoNBYPiw4m5XMaErzwPDfVvbfue
	 dWoVTWQObl3meWvgqRrvvcWFdoEv2qrcENE5O+48GDtV81H84hYS84x5D1c5tQ2KLSdB4
	 gsMk+D08zA5x/qYMhLaexyDrqKfMCM+8sHvVdx+sHh8hmivzPu7qNRVLD83IWRi1Oz5/g
	 E9COg8Vyq1jQDTTMf6WeCh6fxGWIx/uwB4/j5YAB/EwQumtGAfCFC1I6tyqog5j53OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485902;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=YPGrZtQTSZxURuuST0ifATlw9hrQHZEhB5CNPEdDARA=;
	b=qC2ZtkzeFdTXH7mG0oD/VE+McHIWODCgaiYm2eKYihJywbvIFVUGAMTy7JjGc4eQ0Z1g
	 E+hfmnJHGpBHxBFM9J0CxD6pERluHwH9Z3OiPdz3b9ZbPy41VVVDNvN0EsEptLBudNUvM
	 vc8ItkhifLBqepZ1+iymO2XzttbqZjFZXAT7zZRI3xdB9+d4H6w7yXN4FXOegzrw77/Xy
	 PaajO5qEcUOZsal7su4/CmllLVgkP+V3TnYf1JYtUToFTtUhqQ+vPzr0aU/v5AZOMUu2d
	 kM2U7BiuGIG+AonEV0U2CCpRqUR1ZHWPba4gn73AEfL9e/p1E0LWCjQ/PD2HqbYsizA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=oYoVbiv6;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C10606A334;
	Thu, 12 Nov 2026 12:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18C10606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=oYoVbiv6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794485830;
	bh=YPGrZtQTSZxURuuST0ifATlw9hrQHZEhB5CNPEdDARA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=oYoVbiv6JF63br5AxkgTecrgbT/P2oS+gTpYkdgsxw9eOb7KEuJ/fPsz8Kc+xlTLw
	 r0OCusPZnsfAuxXLDmGw/h5lPQyA4jzVwgbv+/iUWEm8L6gmXULURRCFt5sUiYo3Pf
	 Nauq8h0sXxs8oeBaTamOSIzTsC0rdsADc4ccvpx0=
X-QQ-mid: zesmtpgz8t1794485812t43c5ec44
X-QQ-Originating-IP: JL79jULWRDamYAJoOF8fuylu44LwFj2biUTYVg1xBn0=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Nov 2026 20:16:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6304755034306503568
EX-QQ-RecipientCnt: 13
From: raoxu <raoxu@uniontech.com>
To: valentina.manea.m@gmail.com
Cc: shuah@kernel.org,
	i@zenithal.me,
	luiz.von.dentz@intel.com,
	pengpeng@iscas.ac.cn,
	brgl@kernel.org,
	pmenzel@molgen.mpg.de,
	raoxu@uniontech.com,
	gregkh@linuxfoundation.org,
	ihadzic@research.bell-labs.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usbip: Close all listening sockets in request workers
Date: Thu, 12 Nov 2026 20:16:48 +0800
Message-ID: <E063498E65C71B8D+20261112121648.1458957-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MTGYztYhR5ETyfZumcjdLN40YyxkhYD2BBnNrNzfjJXFx9vmD0dS2X41
	rPrCLwPj6QuVrUPTIDlylAsS6TW2B0SPG1qXynqLec9ZJGq7kUntJxlvMXdVGCtO72ojdwS
	njRA71BBbVgUhzc+goP3uoLOArmF1qxhyaW2YSa3C+mXAaPKYYUPDBfEqg1vBCg3Pu7jILN
	RvlaoK7lMsI9yI2Sx4hXC59JyFyFSrH/Mzg2rEiwLNNm6kthFI9GXNsUjGoZpDAk7DZe5RT
	Q7aJV5E36Vl0SY0T19fdYKTVQHtT9FO2l3D73SDUw+/nP5Xm7O0n2SjyLDd9mE7epVRSWW8
	P0SwOSm1fh/beBSHXXhljnTwoltkkXJJnc4pDD5NjYsUPi5+JzR5fCMrFik8FmCKbxn6Z17
	yCv7oVxKBHRVH0oJK2l84tAop1ZG4O2aT4/jBLT31YoD3gsilB891xo7OCJC/Al5EGTteEv
	ZqUgRZ80+Xry3Q5YxeBqA3h2OjX8ZOCoHU02AoEak11xntEmOKq2JSXVwECBAMOEsgCjj9h
	kmts8mUBrkBPa4z9dO+U48MFarTpFmngRS8o6WoRIQ1zmLN+aFyfUOPoHYlBsNrimAgaKlS
	pvEtiq2rYPHvC379rB7hKrVstSFmsXLq1/6q5vx1eQx0sXUVQmQcuE2cZY21E+DAtDIXf5M
	6/8eHkt13/5kzSB/E80VtuKJ7epJV27b7HFAI8CGxZFRsc1Q0t8PZkZCDIXOwk0twrF2mQ4
	07c/Xt1YKA0TSlP3ST921GqVAbnnz7QJ21uOmgUR7KSe6M9Ozv6AF7yU3OEAFHLv27I1OW0
	I7AB1H6BReEtIIza2GrT1IsuoNgOT6AwFg5miOqD+vKZGCTkZ+csmxSI7QnpXAb0WBrTWD1
	34G57OUxoM80ovJVPwP2XhmAM7k0DCHnY+li1hyjLNL+B8kVIZdQiCOIPX5AU7oBcyi3XsF
	8yBNW5Pilv7BUK5pREf3NDNlIGePdMW13naXj95Wdq6fLXoKNwJQmF9SgfN47J46drV2uWO
	Ya6u2KqNFg/3phjheM/NuqekKzE61lJnQUKbFO3n8jiX7dSOcKcTWH2Xdgy+1NK1I6HopAP
	g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

process_request() forks a worker after accepting a connection, but the
child only closes the listener used for that connection. All other
listening sockets are inherited and remain open until the worker exits.
This occurs when usbipd listens on multiple addresses, including the
default IPv4 and IPv6 setup.

A worker waiting for a client request can therefore keep an unrelated
listener alive after the main daemon exits. Restarting usbipd then fails
to bind that address with EADDRINUSE, or starts with only the addresses
that are still available. A single-listener configuration is unaffected.

Pass the complete listening socket array and its count to
process_request(), and close every listener in the child before handling
the request. The accepted connection remains open, and the parent's
descriptors are unaffected. Make process_request() static as its only
caller is in the same file.

Fixes: 328f7f8a0a1c ("staging: usbip: userspace: eliminate glib dependency")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 tools/usb/usbip/src/usbipd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index 3e22b651c754..5ff5b46674a2 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -339,17 +339,20 @@ static int do_accept(int listenfd)
 	return connfd;
 }

-int process_request(int listenfd)
+static int process_request(int listenfd, const int *listenfds, int nlistenfds)
 {
 	pid_t childpid;
 	int connfd;
+	int i;

 	connfd = do_accept(listenfd);
 	if (connfd < 0)
 		return -1;
 	childpid = fork();
 	if (childpid == 0) {
-		close(listenfd);
+		/* Do not keep unrelated listening sockets alive in workers. */
+		for (i = 0; i < nlistenfds; i++)
+			close(listenfds[i]);
 		recv_pdu(connfd);
 		exit(0);
 	}
@@ -568,7 +571,8 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
 				if (fds[i].revents & POLLIN) {
 					dbg("read event on fd[%d]=%d",
 					    i, sockfdlist[i]);
-					process_request(sockfdlist[i]);
+					process_request(sockfdlist[i], sockfdlist,
+							nsockfd);
 				}
 			}
 		} else {
--
2.50.1

