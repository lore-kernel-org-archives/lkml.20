Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892583;
	b=dyIIafDPcjMJYINTqb9fzHL2r/sERYV01ONzthp3juhX4zNwhgzmI9C81yBrNPhau2qa
	 wjDBcQJ/r7OhUJgsB7SXSfwyxRSZ6oj40K+59yG8eLNCZqSnI5+TIe0EA7gPjiKToSnl7
	 /+9v872qbZ7TY/b2s+6M2gfdH5UsI5WdvenJcYznepz0kd2SUCGkXiXUIA4/gyDnSGq85
	 d/eMX0Cj+RDBPlWU/oBeZ2d7HQ+4seb7S5mBa9tmThRobOGuChfpujAbERIShBtExLJDA
	 Xfuq7EHSaFwSFbiC9P6+tWF2uymCvBTL1HvU4eNqcJUah2QLBnltAFmneQZTKJKtE+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=og1+N7jhageKspGzi0Ed7TaLd17MzbrlGOOU2ay2tog=;
	b=m6TB/dse/wp06Jqc7CzZLyn5dOlk2C90K00xR1ilTrJniDE/XoYNfIMS4bnOTWP3LDI/
	 Kphoghvl3ASL/PSkSMKu60kjdpazSPTm2g6gLwEr0z/2v2hqt9eoyiCbGq2nwUKwKQqfc
	 M5QSspodOGL/sptm2ZWsAHs/0GWkoU2xGmRyZGrOa3+Iw4+oIB9zu3aI5kFk5Sy8Xvo7b
	 4KG3uv6m6OIoSUyyfe2gxpM75NRiABcGiXXqtIQWT1j+uHhtkTSz/5st5L2nN2Zs0X3m+
	 +CYRfCGvGyam0INhqm8Ff7DozI/j3VQY4+RQRMQrkqymZaBBXG6z6pvMUh2Lo3usolA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=CcyYgftB;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E14606D83C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E14606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=CcyYgftB
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6dde81a6820so1284794eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892582; x=1794497382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=og1+N7jhageKspGzi0Ed7TaLd17MzbrlGOOU2ay2tog=;
        b=CcyYgftBoSsbCDySi51V7MlnY4uBcriQ5+9DPQgmfyC8buGXiB1LCPnorJ7oCsocCV
         ypg2ddwIIOHp0OPDeTaLKB05Rjdu17gUh08Zsc/TaP1hVEam5u2Uazd4/f9I4KeE4ne/
         nYwQiJ05zUP5KuoN/Qr9Bk60b01vGd4Cuti0yJ5pneLCKofwKbeKLF3sXxeyoU3U76Gc
         GyNp/1CBELpm/q8t6x5hxANw1N019hZFGSRqnpQJmTjE/g0JorrdxZDHfYI0KB6jdgfI
         hRKiVt+hdj9etmC2Ly1yJ0VlI1yHU/yHMqRwkeAiA7N7Aiq26ZndHwjUs35MwvrMQskf
         IsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892582; x=1794497382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=og1+N7jhageKspGzi0Ed7TaLd17MzbrlGOOU2ay2tog=;
        b=HiZufP4zSKZUFVwoGyOVUyGhYN14iPaV2LO0QUNRTcUQ+aPOqca9C94XXAoAinkeZ9
         7/d5ju29dMIg3LWUqFvKcCQSWEFSBeg+nJmoLU9wxOiuAOGeWsWG0SAMZUqBPUyoQRJX
         +ko/YWld2aQgY7YvjWE/g2m2SITwfDWpegQKenED4j5IG3FAWMczL1WvASM9kQcAv/kN
         JEk/M5DtbGayKnL3LT9zu6RIdas6j1Mzpg46QjLuaWFwoAc/WISbrQaqUp2oes85qGRB
         EGdDdDXpVTLkIzxpydrJ4zasAiPSxfdct2TfaIdLGgAVSW72PRPO+65IXdxNHIDO9h0u
         l7Mg==
X-Forwarded-Encrypted: i=1; AKwUvBw01uvM7DsWvoBNA+PpApn48VtamQpbE2pqBUOAtKiUQ8b3grEf2k6MS0G7Nesd1nmD3uROJrfDvPIJRPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5G3mEi+CcuYkLOgx1+4gg6eRfsgi+M74blFmNFBBnY9E7f8pD
	8BaDludgp290uyoQIhaZPrc8z1O8FZD+hctFe6yflUlqI4VPwAmJg+hqgRFn3/J378o=
X-Gm-Gg: AYBFou39jYuUJEMLsIJJSi8fa0gUVXi22V0LkefS2C2TNfu9h1hznIuEQBun0W8p/K0
	6J7J4pve4J2CU7n6NjCjPHfmjF2g0WEPffVs/2B0YRSgh75Lrd3ckQtIEql1rRKBwYslrYQm6lf
	Ps/zE0kkgA0GohGXzxADmwa5GyBK9AwdspJvOwxa4/qL8ek6V80XFn5thbZGZHpaqLnVsMuODqi
	ocdaPYcVgEZOTk06w5o+G6cmlzmklPKnb+IwqBkvrRdNk/qEGGnPWgbxFHrZJchi3Nyc29VJo68
	RMh2mEsQ6FaKTV/qrLP1+0PzvBKDeGOL7cZ1nNgkLiG53JKeIFD02MOHBYjqLvriQV7g1Ri4G/c
	4dJLVBHHJrx8EVdAjNxyOMp462Jaq6yA6562zUGq2Sz4z1dkzLtsb2lQSqcX+LdVoLr/hIFfaJu
	pGGKOMSXg3hB/+MVosqq/hmlfsxB2us2Oafk4wTqfthGLDga/F9JazBFPdVBdK0HG51lAeW4VhK
	46B8NSWHrGcDFhIzpnZnRuFqRY2oG6+tGyU6nwYADWVnCFnIRkS5pinoZ9sm7X97UclLXhOUU9F
	ho/eU1R5tJRJsLcGjGolaf9GRbqhjnhWZLRRb/2Q7l6e4w==
X-Received: by 2002:a05:6820:c44a:20b0:716:ca6a:c0e0 with SMTP id 006d021491bc7-716ca6ac11amr1944338eaf.65.1793892581873;
        Thu, 05 Nov 2026 07:29:41 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.246])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e603b9sm4702772a34.20.2026.11.05.07.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:29:41 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:12 +0000
Subject: [PATCH RFC v3 80/90] net: use net_may() for the net sysctls
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-80-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=1521;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Kgr2KKzA6ehyBynmXRdAmjrH+vzux2Kj9vyi21aEtV0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFMbcGPvnriPVc3tEDAXLk3f+pGA3tqe4I5LX7sQrFXFAjD2YFhW+8qu4zzRXsxV5cZlg5IigUc
 AhZjYH2vH8w0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

net_ctl_permissions() gives a task with CAP_NET_ADMIN over the owner of a
network namespace the same access to the sysctls of that namespace as
their owner has. The handler of the IPv4 forwarding sysctls checks the
capability a second time on a write. Convert both checks to
NET_RIGHT_SYSCTL.

No functional change.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/ipv4/devinet.c | 2 +-
 net/sysctl_net.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/devinet.c b/net/ipv4/devinet.c
index ec57948ffbb3..44baea38bec4 100644
--- a/net/ipv4/devinet.c
+++ b/net/ipv4/devinet.c
@@ -2602,7 +2602,7 @@ static int devinet_sysctl_forward(const struct ctl_table *ctl, int write,
 	int val = *valp;
 	int ret;
 
-	if (write && !ns_capable(net->user_ns, CAP_NET_ADMIN))
+	if (write && !net_may(net, NET_RIGHT_SYSCTL))
 		return -EPERM;
 
 	ret = proc_dointvec(ctl, write, buffer, lenp, ppos);
diff --git a/net/sysctl_net.c b/net/sysctl_net.c
index e190a639eef2..1a79b8a3674d 100644
--- a/net/sysctl_net.c
+++ b/net/sysctl_net.c
@@ -45,7 +45,7 @@ static int net_ctl_permissions(struct ctl_table_header *head,
 	struct net *net = container_of(head->set, struct net, sysctls);
 
 	/* Allow network administrator to have same access as root. */
-	if (ns_capable_noaudit(net->user_ns, CAP_NET_ADMIN)) {
+	if (net_may_noaudit(net, NET_RIGHT_SYSCTL)) {
 		int mode = (table->mode >> 6) & 7;
 		return (mode << 6) | (mode << 3) | mode;
 	}

-- 
2.55.0

