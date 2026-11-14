Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657165;
	b=RHoD8YeT3Mg/rpaAqK6DYTrkmFmNDZdy61FwVzs9HUpAI88NsPd+WyqzhIKDJe5St688
	 lJbsB9Vm5ghd6nwtWghpGbg3LdstdI/hf21EM7nhC07GzcTr4+Y2VIpBLOKkSu/KW9P5i
	 hHdjtkQ3VRWM6FsyVTa6ReYVgmWkm55QugwQB45Yk+/fYwdV4flkFxZJfT6WTAVm5SrQR
	 m9IIxj7xLmPD6xqxfObpo3R/UFRBBEEvcMeqvAgD/dUPQWQEAPhsPysA3M/Vb5WAtrJPL
	 T4l/Lmk+u39q+CqbWWDxSlMiaGMLutXwKip7v198Zq0sucPqkH/epYYX2522y695BvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YRKVGMHjS3p2r84erkyfVinxVv6si0HhmgQIB1esDbw=;
	b=ZTc1S+6hownVl1yrHsLQWlQaG2y0hqITHn9FwM7uLsZek6iVr8wdB99Xm+A9ntZLYm70
	 V4kDfmZXvvqf3/XrhnwJmcPnLiioUv4Xydo6kXvqQpkljjqLWoQGXaX9ii1KIVZowJGRc
	 rhEYX2gkhzdC0NkvK0WBa14XFKOc7mIN3asO9cFLV34/mrdgnSkUIxhgcefb0PDZPcPxQ
	 Ma0cRkc+kxZZBgiyVdwdC3Va+h3ppYFIhTX6HO4Q0xl4qX2HQpYVFYR6rr5/mV8ylfnlC
	 KDAzHN1610Ny23WOSzWMUSs4Ldo6l91CFTWxwHfBzOZKnAqPQ4UdEAAoeqgui3ODSqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6U9PXxx;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A77606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A77606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6U9PXxx
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so22857045e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657163; x=1795261963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRKVGMHjS3p2r84erkyfVinxVv6si0HhmgQIB1esDbw=;
        b=S6U9PXxxEtF0JXngqOOGXo9QKTxCGJqS88mLrc7a97OkN6fwp9dpvFs2UBTVzJ+wnT
         eoRnGTMDvOZ0yjqA/SAMSao1uolmXhL6VawcHJDQD6FI8OXsg1PIX++vf3Vyy7V5xFsE
         7L6+51mhJQA6ztF8H+LN5JIs77kL2N2Ul+nyDLLdR+N0uiXuZsr/6njGUaXqz/uFfkLy
         8acqaloIZ8qIHYjoGE+e7Ty3cztsssOwS83Sq8HHCL4/9CGn+qPFsJ12BPq1F0qGoU8k
         FG01h0blYAjkbkmD3Bv5MNKStCHguWQGCUyeMqqiwq0EI6l6TPy7dHulEqRtXn1Rc5D4
         XX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657163; x=1795261963;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRKVGMHjS3p2r84erkyfVinxVv6si0HhmgQIB1esDbw=;
        b=gwV3QXpdd9P+BNTvU/aBOTHXlPQv01miG2x/n7G38NVF1c52GRTOZE4nCKSnpj9PCv
         ft0t49peTK6ezHqjkF7JkF77oXJ8dTyungEKvFTuBh0HC7euYKPMP3EsfdIDssue8Ta1
         PsW65SJ3PYEHkwoN6xMx1r1dR0btXAH5j5oX7/t4m1EnPWGABs68jX2vEvnfpE65h+9p
         G1wbREXuZkd1/h0fqLtjenGfxBACD8oKkZlR5gU0ies/z207y1vySSBiVclibFWFV/XS
         FAgsC906wuxO1yprUvBN5UEYUubIG3MD7QlCiTmmF41z03PQn7KpW1QJs8VhCUKoebdN
         Skbg==
X-Forwarded-Encrypted: i=1; AL+hErFdmMrVe1TGJNa8mYX7unMLBE3X9+02fzhHCvOgUxwCVJbzCRycLtexgGsN4naazfzqVwW5js54TlKP9N8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h96j6+PuPKYvBZC5UBNUOYcCJyMM5HYTtXSnfLfQ5QsrOCdPC
	gju1TYUADfViSl+5Dzo2SurRta4kbtEUfo6VecF58DXSfLzrxGp2GVMY
X-Gm-Gg: AYBFou2j2UFaXE3hRIo0dAkLR/saBqGWzo6XyVErd+FG2C44INUB/1mLRey/1Fbq+86
	2vPHWwAmeYZkG0oQPzkASeXuHSH5Xemjs4Y6YSRQNzSjD6vJuhtZr9I0ebrQXe5GdBfYeiFFHcM
	88mtmUZziyALEQdpvkmeD7RLIrJJnYCUkZIW6D1EkMhRa3Rw8uh3wu8blx2MKoMB8iQGBR4vdvp
	45TkwaUuD+0fiNISPvrqb6nk5xRY47iBbqpp8WyIdJ9nuvLut7IACOhdqD8fON3y099U+wUy52b
	K3nsAShWaoxMirmvCSF1+6KZmWR481jiURTA0J33zYnYn1HSSUcGe86LjOBSiJR5D0OrQ2E0uK6
	Ln4c3iFqY8OlCfdDiCf4ciQ5MH/Ejuc/dhxEy55GGezBvGgi50v36u39YiGsSKofWhSPr6Ht61+
	FLhPDQNylfUf28dQRJM95qvMeZC2qKjHm9LPw9IdAu6IftIdwMpB2TA6i1eNCJYcSo49/l3mV0Q
	d3uyDngTeQzcr030egluf/r1sDT7ITEqaOTfXp+pSFdgyCXuV02+BfSro3C+nNni2MSfzv0nyYF
	DVZB75dJ0VJE8H0rgB7Xuw3RXQ==
X-Received: by 2002:a05:600c:4e8c:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb60ba4a70mr41019035e9.26.1794657162818;
        Sat, 14 Nov 2026 03:52:42 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm9072338f8f.19.2026.11.14.03.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:52:42 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH] bpf, sockmap: fix cork data loss after redirect
Date: Sat, 14 Nov 2026 14:46:52 +0300
Message-ID: <20261114115222.180345-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
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

In tcp_bpf_send_verdict(), when a corked message is redirected via
__SK_REDIRECT, the cork cleanup path unconditionally frees the entire
message and sets msg to NULL, even when only a partial send was
performed (tosend < total msg size due to apply_bytes).

This prevents the more_data loop at the end of the function from
processing the remaining bytes, silently dropping them.  The check:

    if (msg &&
        msg->sg.data[msg->sg.start].page_link &&
        msg->sg.data[msg->sg.start].length)
        goto more_data;

can never trigger because msg is always NULL after the cork path.

Fix this by only freeing the cork message when it is fully consumed
or when the redirect failed.  When unsent data remains, keep the
message alive so the more_data loop picks up the rest.

Discovered by Sashiko, not triggered, not runtime tested.

Fixes: 604326b41a6f ("bpf, sockmap: convert to generic sk_msg interface")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/ipv4/tcp_bpf.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
index 8cf63a9e7fed..e6a8184aad6a 100644
--- a/net/ipv4/tcp_bpf.c
+++ b/net/ipv4/tcp_bpf.c
@@ -499,9 +499,13 @@ static int tcp_bpf_send_verdict(struct sock *sk, struct sk_psock *psock,
 				*copied -= free;
 		}
 		if (cork) {
-			sk_msg_free(sk, msg);
-			kfree(msg);
-			msg = NULL;
+			if (ret < 0 ||
+			    !msg->sg.data[msg->sg.start].page_link ||
+			    !msg->sg.data[msg->sg.start].length) {
+				sk_msg_free(sk, msg);
+				kfree(msg);
+				msg = NULL;
+			}
 			ret = 0;
 		}
 		break;
--
2.56.0

