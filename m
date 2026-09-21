Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D734BEE46
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010229; cv=none; b=CiwCDWbfPMuhe+3cMcF+lPfEgP4OL04TBV7MhibI/q5LXl/+/rz9qA41a6Uphx6pMjeBPAcx4Op3u+ipXVYPDXJe8MHkNVt8rLDFsdqcE37O4I3kWY2B3+66NBkoAOcr11XEJ+TH4UnI6uWVhgV+UaFcAmVmU0+7coHHo1uH9BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010229; c=relaxed/simple;
	bh=68vTwwjgSnNRQpy9d2c5Lju/Q7J8YurUvH9POQxSmpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFXyAHBC4xY1MEhP4OQnpAzOJjiOG/VF450AGjf+6o1QiHlZDyXxwuHIsaNgOZ/hN7Ms4n7kB9rZhbrLgyNJwj894vTR+l51WMNzHJu8T3GZaHGVHIIUD+4LeCLVL6h3vqDkHOwf+aJGN212tm/3Mqt/y1u66ZfJ95MIA5GEMoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWF75bhm; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWF75bhm"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so39294645ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790010227; x=1790615027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68vTwwjgSnNRQpy9d2c5Lju/Q7J8YurUvH9POQxSmpE=;
        b=aWF75bhm2Q/ZKJpnpaf/eQSFEagERJDBe8buW8VCpkLo3dGHMN/lG5po7g+/najr7R
         qTcRbIfPITqizHaCinNu8HVBVDrdYZQ80XKHJQ7EHEsLIYuSwVgH6cCldRB+g2hjHvLr
         mEof7NwNM5qz9arrWTE/RvR9f8pf/O5g6ynNWHHS1aNtFepxPKJoTF27QGClZiL+r9hp
         A/PmHU2fKT6iJz01GyDt1EiMXgevkWZgHS3bgmAY5jksh2gYXgWIQISKz6JtUTGXhs9M
         tTfiQXJIWE+IqZg0OglbQk9Mb3cVf6vramHQW2NbGKssLJFIVxoZ/PLO2rgDwO/WOab8
         a6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010227; x=1790615027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=68vTwwjgSnNRQpy9d2c5Lju/Q7J8YurUvH9POQxSmpE=;
        b=lia6kjcRFG5WM5ZQJWcoDLHxI0oNHW6T705STNITVnZaGAj427vzGE6QBAmKreGth+
         6ICNH8dnAcqSo2wy3vKpPMuZxkc4Q0b/6QWJUOtP9baxNxDVajOQaj1dqi5EOhzcKkEu
         yZvneyaTvVWiYwjika2Kp1ckSPjwZJnJuo7BPUth1y7bu1iwY5GdIR0NisZNejX/NeTr
         wfQRpfZrpko/hFb2Zx1nuB63OrTrhusqGJyzUJmbby2jw1S39z1HNcs3GDPDCu5m6zfE
         uCiZV262vWXGWoyhawMkx2THLYiyMig96XDc8Xyg2aa2XvSMJvEdi7W9Pu/fT75N0G8v
         0TRA==
X-Forwarded-Encrypted: i=1; AKwUvBx9SE1a1PTE9lgb/BUElrvZVOs64V2ZmVhnPIVJEn1UbBMrzUxBTKbzkhO3aclVRGce/5B68Zyv0MqGhys=@vger.kernel.org
X-Gm-Message-State: AFuF++nSA4zSNFqh+Tr91MqMOc8iquOFQWPcTvZVhouJ2LhOxUv2pJrV
	RWYui1X0MBZaxzzFufpDq9C4dzSkHwp7cpKj8nQWDXvUXOaxO+odC94B
X-Gm-Gg: AYBFou0PzDBkfOxSyxSGvswPj3Du2eL13sA44eYEjCvlkakNlBXUO9UBT6o4/r9whwP
	zqjYwT0uzNRYoz10tfT7aETMb6m7KTcw1o4AZOeFllxBZplnVLDe6+Uy2EZAE2rRDb3vYfFgvM5
	HMymjCQyTpw1wgnJnAzO561elGrWnNgNPkcAhA1S1y7M1bHlphrCjdp+3LpVoy3URr9nQCOyxnc
	rd+nkQ7KzuStWwNdr0/e2kVaqi3zL3mQxwdkD8gTp0TSAcK6BnETAHbJ9PjOXmtqqn4n2cu1OUD
	KvGPmUSnlYIWGzpmo6DZietpRs+6AsFnDyEQ/ZAS15P5jqkislx4bHYnbFIPmbTCxWgiiCsRhIk
	NA3kFUenAr+BICsp39FRrK+iELwwkjIQayTwvB3Dtz0YioisDkQ6IMwiW3A8UqJnnbcnAxjIRhf
	8dNtwAcd/4Bh1xMUkeQpKOvjvJA5yGTV6DJt55iM5jcLcRHcHtGOlXVrdGxH9eeA==
X-Received: by 2002:a17:902:f687:b0:2db:2413:87d2 with SMTP id d9443c01a7336-2ddb1ac954dmr166648125ad.4.1790010227210;
        Mon, 21 Sep 2026 10:03:47 -0700 (PDT)
Received: from adi.. ([122.171.20.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b4a8dsm37103275ad.12.2026.09.21.10.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:03:44 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Mon, 21 Sep 2026 17:03:39 +0000
Message-ID: <20260921170339.1406-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <arFL5SLHwLflaONc@stanley.mountain>
References: <arFL5SLHwLflaONc@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

Went and checked for the things you suggested.

Fixes tag: git blame shows this check hasn't been touched since the
original import, 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi
driver"). Added that in v2.

On MAX_BSSINFO_LEN: I couldn't find any rationale for 1000 anywhere
in the history - it's exactly as it was in the 2017 import, no
comment, no commit explaining it. Header (24) + MAX_IE_SZ (768) =
792, so there's already ~200 bytes of slack in the allocation beyond
what ies[] can actually hold. Looks like an arbitrary/conservative
number carried over from wherever this was ported from, not derived
from any struct size in this tree. My patch doesn't touch the
allocation, just tightens the check to match what ies[] can hold.

On the timestamp write - I don't think it's corrupting IE data,
though I get why it looks that way. network.ies[] isn't a pure IE
list despite the name - its declaration comment says "timestamp,
beacon interval, and capability information", and collect_bss_info()
confirms it: it memcpy's straight from the raw frame body right
after the header, so ies[0:8] is the captured TSF, ies[8:10] is
beacon_interval, ies[10:12] is capab_info, and actual variable IEs
start at offset 12 (matches _FIXED_IE_LENGTH_ used elsewhere in this
file). So the memcpy() followed by the timestamp write isn't
scribbling an IE entry - it's replacing the captured TSF (bytes 0-7)
with notify_timestamp = ktime_to_us(ktime_get_boottime()), while
beacon_interval/capab_info/IEs from the original capture stay
untouched. Order doesn't affect the result since it's the same 8
bytes either way.

That said, I'm not certain cfg80211 is fine getting a local boottime
value here instead of the AP's real TSF - if that's actually wrong
I'd like to understand why, I don't have full context on what
cfg80211_inform_bss_frame does with that field internally.

Thanks,
Adi
