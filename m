Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFFA41A8F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780385; cv=pass; b=CQkbyD3u2n5b2nKXv2yTmsUUEHjGBAsPWqTX82b7sCWjalpUOMD7MLNuu3hXZbRSaJSsQV8kJfmOtEa80CDCkfiGipwgwFRzAoF0TSz68BYKF8KrKClc04huqlrHtEMGRCyVMERHKIp23fkLrWXPNhP3jv6kngcTxXGSXUKvPBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780385; c=relaxed/simple;
	bh=ArNFJkH4bUtnh6Np7CzAWvaFjCmzU4yvd1vJoMj1B+I=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSYS5lIrv1FvmTppZGpftUBlSCi9j3dcFzJBVcZZX2kFO5C64CLaUet+5uhhLjQUm66Ff6uYIVhZo5lw5UYQR2674EXYF6nWEPs2mJKukG18jXkA1YZakB0pJ+p/HMd9KhfFHLHoMd/5K9KcXUelEU/jGidvLscgsMLWEiinDV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRttob5d; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRttob5d"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2464700a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787780383; cv=none;
        d=google.com; s=arc-20260327;
        b=VvKGhqKap//G2YGDfVZIHk0gd+qms0BZ20OwrRp6Rfb7ZaAzWrzTHUVG2dCvd2FFQI
         o+bbOnFT1x74HvFgHWbfCKPbShGsPpmIGDXKqGTsrvnxhyiflqCQHTlnQPP6/ETmUlbs
         IBhayvo3oCpwV3k7tZcXGribVPR9lgar12cw8ScpjueFSBkwX5WcrTP9eHi5Ms0K5GNp
         1RbuBypRBDFQHDxyIjiNy78JS8pUj+zQMaTz323DMFGddEy94RIRN7WKVW3ck2LpnPvK
         MxNjyr+yNTWNpjeH9c1jATiFrWgifZIF4Nx0wHmvhtkSMTekGNpMEDCv4PZ3KGUPCQe1
         LOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=kPS8H8k9KpvigDORStPsZkpmZ1Nd6hAKRPDeRw+tD5M=;
        fh=6qZ6UBo18EreyTTXiLni/9OZQubErKqgX0AR0nb/MdI=;
        b=hgCFycC0wVJtza6g8vUkP7EQKSRL4AM7F6jr3KpHYGwRTyyTWOKX9hM4aAF5xiTJjW
         iyDsWa/+H5EYLQMETOl6gOELb/0ipdJWiACQopbcE5989CcAg8Jq8Qaw3B6+Ka0ymkwv
         arPbcfU9NqTYG5fAZA//pEyS0BciBbBVLk4zmNzRanuCupg1LG1AmW2gLhX1QfnBdX7V
         7Q7cTPpF3FHI3RdiEK6LHujQJEUYe1HgoZxAKwQfqlNZABJl/unWtZAOAFMONHd7jqUX
         wnjGj5igrsH5aFZPnmoeImjlufd1hWBbDT3u1MrJMgqjyojPPehfD6zq2xTrtKzFewNz
         ex1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787780383; x=1788385183; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPS8H8k9KpvigDORStPsZkpmZ1Nd6hAKRPDeRw+tD5M=;
        b=TRttob5dvk4VcZEQyFVPruEbpzXQmuqTncnmX6TPcMsM83z5l6FAajqH5IDIMy2I/m
         vqL/fVv9G+ygUu1omVy23mQPovYEr6JKe7v9SOAhKGgwFlslLu753DTlZej2KcjVRFA1
         FAZwnRpRNbvx6PpVzeVDvV0hfIMYsWGyiaj5utAKFQSsZyqacKUHlBd04sjWXzE9Ze+/
         Eu8QCF3As0x6awIa0j+6zrbsAWL1GLIvpIFoRNogV8iUqwqMojzsS2BTAHjAWndvRRjY
         7O1JX1GwwYL1Wv1YluH6JN9RHYxcYr2x4mHdC+Eco/9dwE27h+dSbcXLSXI+8TR6qfxj
         BXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780383; x=1788385183;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPS8H8k9KpvigDORStPsZkpmZ1Nd6hAKRPDeRw+tD5M=;
        b=SHLy89fw/ZQynoCu/rkBIxnDP9QflBzuAh374SZeMjE2nZA06fy3EUrMQxwFwBR+4d
         hJ83VRRkrdqCwXLXY7eq5urqVxTwcxWSmXHGOsMT9rfzfvQVVLvAkXTwa8BC0Z+krpa3
         CExYlT7WyaNH1NaInsSJwdMQ979lLIR0nexslc8KHVJD+YGPQ6WqLzchpkheAuYkTVb+
         7kQz54PepgE4Zn/tjhERdo+sXetsyDKSsciTeuvG3U/bb1e+rjAclfiTbXQv+FpYC7yK
         jkMQg6GNIq4rqTIfmyliejb22JXPPspNPtrLVY1idlYI7DzfRIYyM4Ke9OhZcLZytOsk
         Sf2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqq2pqVxkJEw21ak0NFCqBdkJ98SaUG9TlvD/NEomK6JrY22U7yjFnpeGCvCN1wgxBTGEgaZMNrP4fVnVc=@vger.kernel.org
X-Gm-Message-State: AFuF++nQbWC516OndRxBoGt9DE6/qNFHg15qd7JM8mIZieGRhLb/elJ0
	WF5thS39qPs0Evz9Xo5x1Krd2C7d7TBWa96w6ktU9vu9gZ+agEu2izaSU4ebg7yFHaapxC1LCyT
	Xip0zvtg/nZGU8OAnLae5uH1PxKMhz7QgktFY15w=
X-Gm-Gg: AR+sD11Jhy3S3wH6i3mc3pSdulUYzIXDN1khrsZ2W1UVLdVfl2c0AHdYX0T98uwL8qT
	GmxpgK9ukGRoQtxXQz/ttnFVBQ2hWdrjXR/N/6w1SRLNdBadkTc1ymdLlIVoV92R/h5Ynqg7She
	157XjIV4tF+EORMDoYUagNCQkJrmGaOLn8MWOmtRH28fv494cgeNmAvP5MKj5vy1u16xFXA93pe
	km+VRbVV0KrI/7YILRCcHUUT0+T7+h3sYrTpnHQRTAMTFSfLpIeiDwLubxV1jORUuWcN8eKFzEp
	mTz69zq4raZoqiCCb4F1uvbS7bCgCCGC7H5AexSzVzKyPmRxHG3fdy5k3EmNbYV3rL6fiBuSG9b
	7
X-Received: by 2002:a05:6402:304c:b0:69e:9213:11b with SMTP id
 4fb4d7f45d1cf-6a5df63b59fmr10367592a12.13.1787780382483; Wed, 26 Aug 2026
 14:39:42 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:42 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:42 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
References: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
Date: Wed, 26 Aug 2026 16:39:42 -0500
X-Gm-Features: AcwNN1U2BbM36RbhmFCQr1E1D2roqKDYtg9A4YU1Yd15gl2_fxg9UZPTYYUjKjw
Message-ID: <CAH=xXfG2Hzc-kNAPqEUsTJ4hwrQ-gYEnFrXHGxL7qpYpggkLUQ@mail.gmail.com>
Subject: [PATCH 1/5] f2fs: avoid underflow when counting free NIDs
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

__count_free_nids() subtracts the retention threshold before checking
whether the cached count exceeds it. The operands are unsigned, so a
smaller cache wraps before the result is assigned to long.

The PAGE_SIZE-derived threshold happens to make this an unsigned long
subtraction, whose wrapped result becomes negative when converted to
long by supported toolchains. Do not rely on operand width or
unsigned-to-signed conversion. Compare values before subtracting.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/shrinker.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 4f6bf5926de4..1fd0ee4f89a9 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -23,9 +23,10 @@ static unsigned long __count_nat_entries(struct
f2fs_sb_info *sbi)

 static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
 {
-	long count = NM_I(sbi)->nid_cnt[FREE_NID] - MAX_FREE_NIDS;
+	unsigned long count = NM_I(sbi)->nid_cnt[FREE_NID];
+	unsigned long max = MAX_FREE_NIDS;

-	return count > 0 ? count : 0;
+	return count > max ? count - max : 0;
 }

 static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
-- 
2.53.0
