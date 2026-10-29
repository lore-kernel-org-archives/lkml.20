Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291730;
	b=gQ+wZE+dokDJfpPfGKt1PPwzgEYEo6pssXSxmlxm0Nyk0Kkl0qQ6eZc/kiuYfKJD8Zky
	 LI/GCPPNA4zDn0PtKLW58t7umL3tr2Qr8mXSF7O2zW0IOiUJTQvVX/1XDJrQ/gAj19arJ
	 3qNw/cQGc5mfofYY4e7zcrM10tFHGV0hMObhEivHR0MsGJA1meDtz5+uuTRfZbjsnTqb2
	 J2+giI3Ssg+kEAT8kJI1C1TaOxwdUcVPk8AyQdgVszeiuLRbGSM4USgC+xOZsMKFoWf1A
	 sFOq+Z8TOvNcHqAV/yOxAL4Yq2Wg3J9TxUsQinK/JIrQV16QIqiFEme/4TKf+zSGIJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LjpmfPa02oFewXlsIf8j68q6+knr6ZZYk1Rx2rngfoc=;
	b=WXw6ZT24GYc1OkEXGMQdA/EtyTEzCDcdlWliR0o5lhv/F3k5DNUSexAJmJ6kSS1ViLuz
	 BL6d2pmi7rvUmakQk0Oq8mQbGD5NS6jzF0AioeSazMal7U2qEkZUzgD0xft+3ZTVLR/nT
	 1qVNjy+KXYOXmqULXIKG+J3cuUxO5SqR/d3XjmeW80KX2isNseOP3vS4TOTCLU413TJax
	 B3gzXyCzxb1745c3UAQIuGIYxjS1m1N/+gBGlOs0NQia0QdtpuoD1GEl/bQI+i9VI9Gkd
	 ZLGEfiltq0KFMU4qERxiWW7LMiNwPwakvJZGfisJsOkCxj9Zdq65FsujeZJPjxtZKoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+HrVonC;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7528606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7528606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+HrVonC
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so3375266eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793291729; x=1793896529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjpmfPa02oFewXlsIf8j68q6+knr6ZZYk1Rx2rngfoc=;
        b=a+HrVonC+ueltPtJX/RKfwzScxcTZsAOlTxYT6UHflrSCP1NyNoO608Z9cAAmJ4MKJ
         3iJQc7XG7LEWHVTphTHdhRKs86nCQP9iu4f4JEYSC1rNVaPvnt3TcdVWLK0qrwZpQkY+
         i/kR5dw2uW9UIq9DBKZyypbpUo3BBj726Lueo011Jn8dxajGWG3YsJeV0od1tVekZLdS
         qTB1w08YCDsugrAAOxwi2kMPpxHWGzrJZxeQ6D11aVGh7vLNOBrgGPfbtbehX9bDSuTN
         U0aTLeC289yZgfShVodZcXDybakZasyKqGeMjvDlwPMKj5YV6KFKgAhRqDyMqZL3wq+d
         SHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291729; x=1793896529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjpmfPa02oFewXlsIf8j68q6+knr6ZZYk1Rx2rngfoc=;
        b=Rrre1MQbsJWCwpSXuaPjikTYQSr5jukrR5wPeuWQX3lCZCn5qOOCtB0XgVtkBiLnWR
         HD2RBRCdcXxAkkDIXzM3qZMd4q8Mwd+0KGWOj2j5hZ+D9ktUscLEyw8Q7ZczG/NXelXf
         jo7ASVjAdXOse/qzq9wQb009rA0PmOOc4EtzhJtJ47F1nb70jWK8FNsXiyLXGRx3efTt
         exUzz81i8WQJJBRstEYIW+JBviPMRkQ1Km1oFdnhS30OQcdHWu8OG7DXYSmh0NKdNuTS
         dONOQElE5IBGb2jMhVRlgwDkEeRx7XQrBapqfzMr32N0SnCffEHdoY5WtxrK6aP3eoLq
         3YNg==
X-Forwarded-Encrypted: i=1; AKwUvBwqKWOP50+4a3jdfCEcAACDjrBlp5GR2ugipRs9N0iA2pwSafQahJ3tXyEGLjp/1htPn9uxf93RrdVsY84=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1ndHvZl6cFfOHH6J7oO9epGMYUjEC6UgSF0BJFVoQRyK0LdkY
	7Dk9ehXv7VN3mFZnQ4PFvrm6RdluMmgMwt9U4b3nHdEIYVDc2tbeICTE
X-Gm-Gg: AYBFou1U2yFvX98anNzDx8+gpK0ja1JDTWGvkDg8VIhDuGPjEescE6VuJylheyvUEna
	YYxmLJ4r+Ap0MgN3tqDuv6jWgbskYCSTcThe7N95G5UTYpsmiifcpeBm7FWqUWPhERq+Eu0zgU/
	i/X/ttKwjVMqGoaY5YNWcyfxAh3XZA9aeix7YOlOmyV5S7hAfFL9+L0a6auYasjehFOSHJT16e+
	HPzu8nykIc6HeSMekL+zJ5G7u9im4S8hE6WwQtyiVLPH9OpkAYVbTGSfjuDV57n97uCNIOZ9e9c
	Pceu8sOkH2IxMUPrcR2l/XUOgdKjDpZtlF5b3e1Xpv+gRyHbTTzQ0R1R3XKB5/LPBBRVccAKNuO
	TcAhtK7BtABpsqXXSj2QHKFBGya6IsaYe7MOfcej3W0y8xgbRRFmQzPJsnGO8Y0zMB4Kfdw72sa
	6664yAacN4Lh9CdKuz7IgxKAPhoxdpUC2a+aFCjJaAQf6eG9/FhnYd+/MJKVvn83vV4u/A5kpoW
	knptzywDBCSiOXGonOyj7gEsMW+FETFeJJuL7m/EsMjp0bWMUj3VArkUJtMCPU5dsOWmi1eCrE0
	CjFGn0/UO+5bDdAqWgT/ImF8L2v40fhv8cQEysfNykuuo+oc
X-Received: by 2002:a05:693c:2510:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a203d426amr7788717eec.22.1793291728260;
        Thu, 29 Oct 2026 09:35:28 -0700 (PDT)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a40fff7d9sm302071eec.6.2026.10.29.09.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:35:27 -0700 (PDT)
From: hyunjungg <hj351016@gmail.com>
To: jhs@mojatatu.com,
	jiri@resnulli.us
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net/sched: em_ipt: reject hook values >= NF_INET_NUMHOOKS
Date: Fri, 30 Oct 2026 01:35:16 +0900
Message-ID: <20261029163516.2476127-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

em_ipt_change() reads the TCA_EM_IPT_HOOK netlink attribute into im->hook
as an unbounded u32, and check_match() later uses it as a shift amount:

	im->hook = nla_get_u32(tb[TCA_EM_IPT_HOOK]);
	...
	mtpar.hook_mask = 1 << im->hook;

TCA_EM_IPT_HOOK has no nla_policy range (it is a bare NLA_U32), and the
only range check on the hook lives in policy_validate_match_data(), which
rejects hook != NF_INET_PRE_ROUTING. That validator runs only for the
"policy" match; the "addrtype" match added by commit 0c4231c784b4 ("net:
sched: em_ipt: add support for addrtype matching") has its own validator
which does not look at the hook at all. A filter using match_name
"addrtype" can therefore carry an arbitrary hook value.

For hook >= 32 the "1 << im->hook" in check_match() is a shift that is
out of range for the 32-bit int, i.e. undefined behaviour; im->hook is
also passed unchecked to nf_hook_state_init() on the match path. Valid
hooks are only NF_INET_PRE_ROUTING..NF_INET_POST_ROUTING, so reject
anything >= NF_INET_NUMHOOKS when the attribute is parsed.

Reproduced on v7.3-rc3 (CONFIG_UBSAN=y) by adding a "basic" classifier
carrying an em_ipt "addrtype" ematch (match revision 1, nfproto AF_INET)
with TCA_EM_IPT_HOOK = 32:

  UBSAN: shift-out-of-bounds in net/sched/em_ipt.c:52:17
  shift exponent 32 is too large for 32-bit type 'int'

It requires CAP_NET_ADMIN (a tc filter add in a netns the caller controls).

Fixes: 0c4231c784b4 ("net: sched: em_ipt: add support for addrtype matching")
Cc: stable@vger.kernel.org # v5.3+
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 net/sched/em_ipt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/sched/em_ipt.c b/net/sched/em_ipt.c
index 3650117da47f..c16469fb3e92 100644
--- a/net/sched/em_ipt.c
+++ b/net/sched/em_ipt.c
@@ -165,6 +165,11 @@ static int em_ipt_change(struct net *net, void *data, int data_len,
 
 	im->match = match;
 	im->hook = nla_get_u32(tb[TCA_EM_IPT_HOOK]);
+	if (im->hook >= NF_INET_NUMHOOKS) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	im->nfproto = nfproto;
 	nla_memcpy(im->match_data, tb[TCA_EM_IPT_MATCH_DATA], mdata_len);
 
-- 
2.43.0

