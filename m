Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793832123;
	b=GjxUoLlsnFPgDu4y/cWZc4p99OFqxuqGMoMeupQw92n/cFYuGBQw0diQydIS6K1REgkr
	 DJEjpnqGAZittjGKQDi5Z1zznaFbeiioweQzPO4RI0jWzoDhmTlRpQZSxMugo6W6mMR69
	 WJss/mg1Ojq0N3YwDwzJzNaW44BDxpgUmC3XjLTlaztcs4omS51a2SmqmaPwdZz2W8kpo
	 pGhukaik4c45aJXLVbmEdn9pjAqr+LBn7khkYu6EhVomI53YuPq2wb9RHygP8MdpBlvP7
	 b7AM8KiM0nvQ243ZxiNXYwZr8mJ4n8eeSaORe1nlLbjSs+9U6ro2Blv0mPueOXZSLTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:X-Mailer:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=WErvo2GLUvNSKhdIQULmZWHJk9AdernDD4tBPDZdzN0=;
	b=YlobV3NfesZCTwuMKilVx0SQLsqp2xOUercYQAi2e+mod4nhXE4IqsCguI0j6rKKuAP5
	 Ttp7qfkIbyslrp9KRPJP4/M48ldd1X4Oa6GMD/mbPPD0KQj9XVbYfoGphG/WyHbgrkvVq
	 L2+wocMlh15y/088T5Sps8k/6Dn6ySpb5hpBpk6p/xo2CXijk8e9zsuTARER8Gxot8Kly
	 i+PO8eUGzgfgW8QIbq89mjiNM/KUdPOy/QrnZ0djJeBYAi34gjCT4ueWIgQ4oaQWE7Ors
	 /XQ6HC6fcMdjbDf8IJoLRdYj48my6HYxkh16T+kCqsNgjfY22Qocd3JA5KfzSBsrlsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6L7IR3F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD342606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD342606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6L7IR3F
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f488ba6e90so487590b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:42:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793832122; cv=none;
        d=google.com; s=arc-20260327;
        b=BzM2YXBfMCCVoGN3dxm2fENAfJzLsBcmmLVhscyTK1jmzJ8AZg57fmUSX39wsKE8jj
         40xCtdlUIPK+zz7tznUKV15vco0k4uWpp8RML+Do1YIDKYXoH/CNiXQJX7DqV014RRvn
         XayEaMXPY0OTJSL6g++HG02iL2FIbmiFfQc59Mp5qqf3hm1xgdu518YGh3p7qEHygmsg
         +u7QLbo5TcoKUtWp/34jUBZEkThfd8Gi5LyET8icTjA6N9iP6OT3NZUL3EYdRclqY2Rm
         9wHHwrjH6YBg71fcDMu+pUoSRzHy2QrOVRLZS94FONUO2ANJ9U6KPIA9KEprYYkI7V7s
         dmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=WErvo2GLUvNSKhdIQULmZWHJk9AdernDD4tBPDZdzN0=;
        fh=tDbrRtSP4ph0G6Chd4IlIM5tCGkpEDJpsv2xzdIYn/A=;
        b=qiNnYjlAHGq2jJ19HUlbJJVAADkTLaLYppiruvW5ikFmRkQCBQgXTlEkchkix2jYRR
         EWgUUoyhxXqvf3GXWIEJi1ijUDFZwxXpdW8rEDX8Au7H6PgcEJeHZGeR0v58n/eP38j8
         peGJNS6Qvp2iPa15SZJNH/dXYxCt5Uythlltqr6NOiwcnZwtnJSmtL9qLOM05qzMxahL
         RO9StE0BwsZzUcw2ErGrv4xRvAzpWuaPJtE8R+LBgjv76YSapZpLGMKpy/t52RSE5e+9
         43xdc3ngnCa4qMQZS4piLgoZm6/f65zQFsc3lLfeM0Av4MF5mrskwD+I1CFuEbJEJ85M
         YtZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832122; x=1794436922; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WErvo2GLUvNSKhdIQULmZWHJk9AdernDD4tBPDZdzN0=;
        b=q6L7IR3FtwIQ0LkPfu40pZoBfPvKqcXL94JSwnjEeU1VRPv45r41nGikNoRjoE6Lz8
         77lQlxZW89Vo7SeWgBTaBEMaMOpRPEIATBduFwLR5eivyQhkLKMb7ebKSylU/zcxAMAn
         QdEQ1u6CmPjFSsiYNaj4KC5t6jTNNT41P6amusS7ikGkxTAkfqgufR9YwGD5n/NsdoS2
         aNTAeeAbvMxzklhxrj9gajGaAY5XC7gbB7a1tPPoXeL9/8A1O9dsLuQHtiIWbSES0Nec
         3mRKNkaJOnRlXQZjcd5BviFWfwnRY3UO1KxvuyTl+O5RHhZndfBroxLdbHo7DdVYrqpC
         C+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832122; x=1794436922;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WErvo2GLUvNSKhdIQULmZWHJk9AdernDD4tBPDZdzN0=;
        b=LDfRTCtAk7bWixnv3rzp4+u8CTlaB0ShQPkTbNPSTYj3y97JRT/9+ZRg0680n90c6b
         edC/QiEcnIOpljFRYCFbKD04ozxdipJb9nU03pg2b6kYllRrnYyfuEGA2Rz8sDIUDMWn
         qWnzYoLy/gy3x0ccZ4WGn4PnJJte24nyDMycpNjclbDFgmN4xDEqZGuE/Dpohp8y6jku
         CrjRKNDJfKfpPuzLaVg8zZL0MG+WtH+FJ3fYj9OL2GGUfdZSOUvwR0OyXQxGI190wq+Z
         VegY8Xpz/lis19ZGR9KqBqOWYoK3mIHdaazHiRixzVaauPN1ajBRb7QgP0PeGowp4eBR
         vC4w==
X-Forwarded-Encrypted: i=1; AKwUvByOZc5S+4S+iou1Q3C1cEcPyPlOSprcrD1xIDfJ8WkSbBocjsb1Kg+1B1V2V9EFReiXNgYLdqV1tDmg4Xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ps2MZ/EmOTYZnN24XKgwti13WgjNa537a4OCNTf8Tb5RiHc/M
	0a3OqCgBTjvU+hFfDHcWVHcqrL0gb5w8EX582+LZVatFtpBir9uoJxcUHFfbmhiVCF0B4LISskm
	D6Zmv53mhN1urYuZP+mx82wJWADVJXsA=
X-Gm-Gg: AYBFou0qSczN4w+wKgx42+8Sn2LAlC788zpb9Snvj8lWhK7+sd5ZdSUDDBFbSu2aHAz
	ohHsHS38QVPAgTOhJjImwzdhPurPUR03RWvJbYVGxOU65Jmi2eh5xsxr52e25wMLwHyPKuYiPQA
	BL1Y3nDs4yFOnC7QkCZSeUUwvi8quD+qyNX2dKkEyXUAHAaL+levMGe8SjNSlJwQ61Xn9ZvywCu
	mkDKAamGWFdu6mdxjnB25Z2sBWvIFNXgHEs3iXLB5NxUIIc3XaPqJVkJVr/ReYuvq1IvH+qT8zD
	sfE8x/4b2iIwADUF6nMgPwWyPs0xqcfJMSE/fffyxfMRq6OFHEE/wOWGA8s+uHDUxFmc5Cf/zCx
	WR7mQClwk24esNVYCSciLpdYp5jqu7DwRiAwooemUwvcRNwxI2gfcR2AM+8Xox1YVcmGVrDw=
X-Received: by 2002:a05:6808:11c7:b0:539:dfe8:9960 with SMTP id
 5614622812f47-5640de0f2bamr12348302b6e.56.1793832121760; Wed, 04 Nov 2026
 14:42:01 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 14:42:00 -0800
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 14:42:00 -0800
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <CADZg-m04iG5kCZ5-yh=Vz_ysYjVDGSYn3je4_-8AzWWfiC-bXQ@mail.gmail.com>
References: <CADZg-m04iG5kCZ5-yh=Vz_ysYjVDGSYn3je4_-8AzWWfiC-bXQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 14:42:00 -0800
X-Gm-Features: AclHuK8VXrXubivnKeWdOi0BsvXqCf5pOWGutxidKBItsHpI5FtVw2Y7RLuRbVQ
Message-ID: <CADZg-m0FeLntAS6XxE-kc74vwH-jAh+jXT68qnVwXuHZNUHzfA@mail.gmail.com>
Subject: [PATCH v2] ring-buffer: Skip time delta validation for the counter clock
To: rostedt@goodmis.org, mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	syzbot+eb74dca0d1eb3ec227a7@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

The counter trace clock increments on every read. Time delta validation
assumes that the clock values read while reserving and checking an event
can be reconciled with the deltas stored in the page. With the counter
clock, this assumption can fail for an intact ring buffer and report a
spurious TIME DOES NOT MATCH warning.

Skip time delta validation while the buffer uses trace_clock_counter().
Clock selection already resets the buffer, so events recorded under a
previous clock are not retained for this check. Recording and reading
counter-clock events are unchanged.

Link: https://lists.openwall.net/linux-kernel/2026/09/20/1283
Reported-by: syzbot+eb74dca0d1eb3ec227a7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=eb74dca0d1eb3ec227a7
Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
Changes in v2:
- Resend as plain text after the previous mail client reformatted the diff.

 kernel/trace/ring_buffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a7..c860d5b 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4747,6 +4747,10 @@ static void check_buffer(struct
ring_buffer_per_cpu *cpu_buffer,
 	bool full = false;
 	int ret;

+	/* The counter clock advances on every read, invalidating this check. */
+	if (cpu_buffer->buffer->clock == trace_clock_counter)
+		return;
+
 	dpage = info->tail_page->page;

 	if (tail == CHECK_FULL_PAGE) {

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
