Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691353;
	b=YsGuIXavFJ0dWD+eZCXX0rpZAUfm4s9KOCGii31Bj8OWhoazVuveJ88357E6s48yi5bd
	 CSZhMVZ2sTZsWr0NSCwzu4badzE/BbD6qBbyt0yyxn5fIFyPwPUvsCCf5UeFH3prU0Ol3
	 k36+gvgq/jS0xjVH7ItiPPeDFcHGfdYhxzUfmFt9tJPWr+ZHQBa3FF21ginqJuionXEXx
	 ONDRNcYnjwI3IbJcIXqyzJeLjhUfav9QlAEovwPbSmkkyUl2ywepZhUvv2y13tetk1bsi
	 ilXnLRXeBKCj5pzPPsiPvdRDOm8oGbv8L0SSLCKyllngyDEyvGp+kc7gtD6YLsh2X5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f0ZLBISeyce6U7/hTVm4ywHVaFNN2V0ZlhVxxqx6eaw=;
	b=yAyLJA3zdKtRY7TsMaQTWXVnlfTOSTzgfV+ksP9OeouPprVbLYzqz8aOBFaoYfeov1wk
	 SsrTnFOpKG7R9EWimOuiSSF/yPiGr9n7sP9BVUQGnmYSWOo/6/iHGscd++DJEla/jB0Lb
	 DE3em20HpOZC0WN3bUSsP1ej1lpE0N2leqV8hj1tKaPkzHE0QIHIwLirLfTnzc0c/UBYV
	 eSPw/k3w1AX9hiWP2OpFc36NdL2RB6I4HcSEXap6agNKTyOZGR6I5PIOn5ydLC1a0bQuz
	 PBVRdZAqIoM1hTGOuQBGC9lF9r7P3Q7htkEzrXLEu1BqxqTF1TJ5PTQHl+aOCpJO2xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BzfT9vcQ;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5D606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D5D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BzfT9vcQ
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e98798cbddso105345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792691353; x=1793296153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0ZLBISeyce6U7/hTVm4ywHVaFNN2V0ZlhVxxqx6eaw=;
        b=BzfT9vcQo0dX9K6hykJfFHWOLKclttgOrxAGaeJvwHPh40AsSaB2+B6F9Pxqkm7hb8
         YF/EKuS3WzwcPYEUI8mQTzKQe57H7DY2pRVx9fKu2nFT96xhQgLhXITu7gs0lhAsElfh
         uATNeLWjFzfIEHZiN6z89LhNyNM39SBZCGe3mpU2mHEuJBeqdt5Q6CWVotqLk2Sdyw29
         o6+Vuz73ku9T1FK0v1w02r2HKp5n2hEk0T404r5gRbt4CykpuinAHNPT1HaWYCjfO8OT
         LTLvQHdDMTG30GSCGhC2peA8PWMd3dWf4DPJopyezHSD4rzWwsCcE4QjbbcwLTWAnQfe
         eHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691353; x=1793296153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0ZLBISeyce6U7/hTVm4ywHVaFNN2V0ZlhVxxqx6eaw=;
        b=qTIsMCM81+TQQoK7V5eJob4OWpkIsZiieJVaTy3BQrnS0QgiYETNMEAQ1B4lHn75+p
         KJKe7/qNpjhEccYEKOVfuLR8Xs8JXHOrCuOjnIYx6ZZZ+cmuA8Yd8f5Yt/LT0GPmDKNu
         JgY6SXELokayxEW/SGxsqvts9SGiJotGsVFG9SmcfVqqpSQCvO1lOzFttdBNoB2LwCxC
         JD1qnHY42t+3X0qDtU/5EaDu4zOVWDYsp7gOh2in+UskFBBDPUlUQ+4JxUGRklts0K0Z
         t7n7ExntRG9hnqLir0/zbP64w4CqG5Ipiwxb49bfV5z5vDAhjpS16C6cw/M+2dS3kLsF
         WGcg==
X-Forwarded-Encrypted: i=1; AKwUvBxzes+G1da5hnIuFYaWjItjwgVef2jJ3VDHqaU/mIuLWVgn85LvIz8My9Hm+ojW9kmvCki05u/e3TFFy2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGUVSH/Q6GImAjR8fMgsSgZXSxL6f5O9JqoUqaI7vxQNIZJ/6G
	JXsxxYitaz0dMGdJuHwlbfnq3p+8U6qiVsABJRcPszbgq8cHh5c9scND
X-Gm-Gg: AYBFou2SIRH8bvvH/N3nPkgcvQDXCbO10CrTc2NtCL7rirCvR8ceTvA1t93KwOCSOG+
	iUrBj33Q27pv94Tfg6OR3cf81HIdE4RlCzL5rspuwjw61jdCNSLeXkEoFETWefsEHw4BCZKGnz2
	x9CFqZeLrU4/zF3BqcRuzTVHXhKQOGYe0+qM/QoLaQpKe5eICgAc5jjdCUcR/9h0hk80NNCRRZ0
	+dQtrqWN3sj5tQxZjcrT5u2U/tWw8QVm5XtzIZfOnry3DGDG8hUJLngLXdhTXo21jNYbJ7PI/vr
	wc2o3rrqs1M05Dc2VuI5i1qo/NXLYFqLHp4qudUPiBMRfohUIa+ES+IVcZ0rGK6n6gNZMj+NN1R
	KTKErchtot99CbDUHuawMYf5uQ7SX5yGOAwcKnBsMRquNhIPezPDbGCl3XNGIrCajJVNOAqIo2J
	fEb+GuVVZ8L2T5qFiNEv0jcxDpwIGhjjknMPa3Rk2c31j17Vq2Xoo/9nvS0Qv2RnlZPg0J/y0LB
	gS601PxL9nGGG+dwwtk1gTDP7FuCZqpXlUFz2wEVJCQCb2y8G4ypL4WmIlUDmbDNLJA8U803+Zx
	yQKjaqV+7sLIi+MRRMcytnR3uOIFunmesPgoBq8YAOazb/Tu90Ekb9IZdmMZ96rYYCwD7bAXnxd
	6hRof+f3x8Cg=
X-Received: by 2002:a17:903:2f8f:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2ea7c169201mr1589395ad.8.1792691352522;
        Thu, 22 Oct 2026 10:49:12 -0700 (PDT)
Received: from test.. ([118.68.116.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af67e12sm1722565ad.10.2026.10.22.10.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:49:12 -0700 (PDT)
From: Duc Anh Luu <luuducanh05051995@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: netfilter-devel@vger.kernel.org,
	phil@nwl.cc,
	coreteam@netfilter.org,
	eric.sesterhenn@x41-dsec.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Duc Anh Luu <luuducanh05051995@gmail.com>
Subject: [PATCH] netfilter: nf_conntrack_h323: fix out-of-bounds read in get_bitmap()
Date: Fri, 23 Oct 2026 00:48:55 +0700
Message-ID: <20261022174855.615855-1-luuducanh05051995@gmail.com>
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

When get_bitmap() decodes a bitmap whose end falls on a byte boundary,
it reads one byte past the position that the caller's
nf_h323_error_boundary() check validated.

For a bitmap of b bits starting at bit offset bs->bit, let
l = bs->bit + b.  The caller guards the call with
nf_h323_error_boundary(bs, 0, b), which reserves ceil(l / 8) bytes.
In the (l < 32) path get_bitmap() first consumes l >> 3 whole bytes in
the loop and then unconditionally reads one more byte:

	if (l < 32) {
		v |= (unsigned int)(*bs->cur) << shift;
		...

When l is a multiple of 8 (l == 16 or l == 24), l >> 3 already equals
ceil(l / 8), so the loop has consumed every byte the boundary check
reserved and the extra read touches *bs->end -- one byte out of bounds.
The value read is shifted below the final mask (0xffffffff << (32 - b))
and discarded, so this is a pure over-read, but it still crosses the
boundary nf_h323_error_boundary() is meant to enforce.

The extra byte is only needed when the bitmap spills partial bits into
a further byte, i.e. when (l & 7) is non-zero; for a byte-aligned end
the loop has already read everything.  Guard the read accordingly.

Both get_bitmap() call sites in decode_seq() (the field bitmap and the
extension bitmap) are affected, and the decoder runs on
attacker-supplied H.323/H.245/RAS payloads when the nf_conntrack_h323
helper is active.

Reachability and behavioural equivalence were verified with a userspace
libFuzzer/ASan harness driving the unmodified decoder against
exactly-sized buffers; the fix removes the over-read while producing
byte-identical decode output across the whole corpus.

This was found by incomplete-fix analysis -- reviewing the recent
out-of-bounds read fixes in this decoder (decode_choice(), decode_int(),
DecodeQ931()) for sibling sites of the same class. The code review and
harness work were LLM-assisted.

Fixes: ec8a8f3c31dd ("netfilter: nf_ct_h323: Extend nf_h323_error_boundary to work on bits as well")
Signed-off-by: Duc Anh Luu <luuducanh05051995@gmail.com>
---
 net/netfilter/nf_conntrack_h323_asn1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nf_conntrack_h323_asn1.c b/net/netfilter/nf_conntrack_h323_asn1.c
index 6830c9da3507..8c04925b7007 100644
--- a/net/netfilter/nf_conntrack_h323_asn1.c
+++ b/net/netfilter/nf_conntrack_h323_asn1.c
@@ -229,7 +229,8 @@ static unsigned int get_bitmap(struct bitstr *bs, unsigned int b)
 			v |= (unsigned int)(*bs->cur++) << shift;
 
 		if (l < 32) {
-			v |= (unsigned int)(*bs->cur) << shift;
+			if (l & 7)
+				v |= (unsigned int)(*bs->cur) << shift;
 			v <<= bs->bit;
 		} else if (l > 32) {
 			v <<= bs->bit;
-- 
2.43.0

