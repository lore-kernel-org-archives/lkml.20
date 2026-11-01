Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793518406;
	b=4LFmS0+rCJMfORZJJEH8XTN/5LkKuAgqbg4IHf1B3gP2L6hhN5R37txXjtJHZeTI4CfQ
	 B4Q8LTK97jiMscLOWl1zFc+glBcWefMeYxQmD8Lz5xYOh8yK1lzalB7wznGmq4PA+eJa4
	 QcM9jOtS6zz+XGiIZAFb+gsucI0uIyq+p0/TVkJuVCjtwWHolTmTJs0QN9fT+1DuQht2U
	 bZS8RoE/ynSmE4/aJQculq7LF0g0D5BQlJPsyJAwHEbIVgfVpLbn4ixpt11ZVM5Lad6sn
	 kJjY4y0dKxwFNFtBkFMna9cfms/KcDk54QNJCA2NNqcCsd9f6eVxhIG2DEbWXxQcE9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793518406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4Di7NHo16WqswM1423JzZNastXlol+kDD8J22e7BNKM=;
	b=aa5VkoOkC0NYgDkbg1uoIPyh5hPFUNWT4zj3rDGbFicAbNX4vo0v3BgjNhF3THOycwDz
	 o6WD7zufJIx4ABMS8t5Oe1lVvv7xkL0Gu44NOMY3/Ktigu73j+sN7+6HqIC7qvXKcLIMe
	 9HfaL5nQpMluIaWbF4fMnUtf0Q1anOpAuOUDQUAqfw1gPUfh1/nVrKDBtQZ781fEKYly5
	 dihCItkFTfdIdil0BirDcQ3T7NWzrARq5kTNv+bPyec07RwPJYvP4v0DoClc7KGQsmw+1
	 tjssVfyDndaat62oi6G7CvRgw6YdMagbUBv4e1PPA+W3rqfXTFJkb0Y2rixOHqSp1kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KS9LywDO;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4201606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4201606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KS9LywDO
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so4018537eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793518405; x=1794123205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Di7NHo16WqswM1423JzZNastXlol+kDD8J22e7BNKM=;
        b=KS9LywDOhprJjBk3rdcUFLUiW566TIVVtXMIGYhSuxMoOU3XVf+qrxGWAqQx+2TUf9
         xT+78gmXf7OQXJH7Qp+O5KbbSarbWX3j6ZEjiXPl6DCNU27PwdEl3gINavm0PKPnaiTy
         yc5k0pwmkv5haHZuB9P+zAWZYDEOZT201VesyyvWwv8CveJ8UlCKQsBZ3l3ZoAttL0eL
         dz4fSFxPDdDBPDVppgaWYB4bQ/fatLWYEo9kpPsSHHg/8az4/qhSw7F3oDNIv2Z6oxKz
         aNtqqq/D+0t/Nod9CquAXSXpsHukLnKfuARDumN1XfsyEH7/TspLWv3POwJO7lYVCBhc
         VQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793518405; x=1794123205;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Di7NHo16WqswM1423JzZNastXlol+kDD8J22e7BNKM=;
        b=amdq9S5BuhrnjDzvrqRAcv7fhUK9NFL4hx4aKg3RpIs8EibxcuQe+sSrf1d6B/qcv8
         TgjjT3VOvw4GjBbrv1Mt5y3kojX0qqAsHwSN1FZ7E/pYNSC1NigpnuO/G83CtPE5fLLv
         L1PUDgYGFJfbgFzjFRyMOJEWE22mXbG38o5YhL8Af5CMqRIkZUcVPKLoGE6W0ZaWPTm8
         R6P+mVftNtYaemHK3U/sc5q42V+Gjik4z4C/YjPoiEK6DnRE5lk8xJZ/oFRyjAEA6QT3
         tB+hmoSBYzyF2ZcDTTMRQpcJHrA/ob3nkzpZA31G5GM7Tz5hcfkgy8vPPSO88T82ZywA
         0inQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUzBZXVjo2Dgao3Sy/UP3VHxfu5W1t4e8oJCVfZhePVbuviDYdlcYDn9GG2Pj39xc9Sp/mU3sG1KYJ+4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iU1qIsCeGJe5AsfuUy24UOy+MxR+cB3NdWMlG4w/hSzTf10GN
	jhiGND/SGn+fZMuiJhjPLP2tDxK1E0By29FOSbX00ZU3KcagxQdzaoqt
X-Gm-Gg: AYBFou01J6b6HnjHnRbiB5HOpxOudN34LqiEQhC5FpOjqhUFEgHdzQr/EtQ44FNUx+q
	wW02g1v1IKgpoctSdosgYMfbSxGsrjGQ6u5QloMRIKLZZC7Qe5fI4CIv8sLiW+euheygh2szukB
	PHbhu4HqS0hxxdf9YfJaoICq+hA/UKIaZPLuyCUW+4biUhV4YjSUEXf3M1sNwf0UPJR238TlCjF
	dR3MKAx+fJYenmCM7zmGXveIMNUfLQYw+Rfi6cshPduejlG0KQaGs7AGazqCNOgL78m651IFPcH
	gOlUAw56hOV6HOttabLKbGqY/9qLc0cH0GyQTsDW4Oo1azdhx0W9nKBYj817e6rdEWO6rYCGllE
	LvPHuJKjlNcQJNaDAkZ6SNFbTN4MSqYN/OSUZpwW49XLkhMq56At5trLN7v+rltlb/r2s53yv30
	ELMehEtWI/9DE5o138RcOT7k3gjPKmXTW0+3IDcptQVT1T6CyzU0pNSZHpQTvZJUSTUKdT5Lr1r
	5giUB4yv1vEjfks8mJPAtnLo5M8HxBhMqekxYxsp/ipf3B0u6oEjfIq5l5FJns721dbtnaVTuQM
	tkjNBdfz3nH62VQi4ywW+14uHRX3YbSyO/xMkB3IaK6vN7W8k2PNKO57PIBM6N+y89HZYE2gsuL
	+LBbC3FiYqsuKRg==
X-Received: by 2002:a05:7300:f285:b0:367:50ee:f7e0 with SMTP id 5a478bee46e88-36a4244116fmr9613331eec.39.1793518405017;
        Sun, 01 Nov 2026 00:33:25 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm5561223eec.17.2026.11.01.00.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:33:24 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Qu Wenruo <wqu@suse.com>
Cc: Cheng Yongkang <teel4res@gmail.com>,
	David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] btrfs: reject refs=0 subvolume without DEAD in SUBVOL_SYNC_WAIT
Date: Sun,  1 Nov 2026 00:33:17 -0700
Message-Id: <20261101073317.1867816-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b4962b1b-bc5e-4302-8456-73b9b8a6474b@suse.com>
References: <20261101062539.1744605-1-teel4res@gmail.com> <a92d223b-55fa-493e-821a-e5acc8afee08@suse.com> <b4962b1b-bc5e-4302-8456-73b9b8a6474b@suse.com>
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

Hi Qu,

Thanks for taking the time to list these.

To be upfront about where this came from: I work on automated bug
finding for the kernel, and this ASSERT was one of its findings; the
analysis and the patch were LLM-assisted. I sent a fix rather than a
bare report because I had the impression that reports without a fix
get little attention, but I'm not the right person to rework
SUBVOL_SYNC_WAIT and add the btrfs-progs support and test cases you
describe.

One data point on the return value: in my testing on for-next, waiting
for a subvolume that was being deleted returned -ENOENT once the
cleaner had removed it, with and without this patch, so the success
path is never reached.

Since the tool keeps finding issues like this, I'd like to ask how you
would prefer to receive them:

- Would a [BUG] report with a reproducer, the tree and config, the
  trace and a short analysis be more useful to you than a patch I
  can't take further?
- For low-priority cases like this one (a debug-only ASSERT in an
  ioctl with no real users), would you rather I batch them, or not
  send them at all?

If the ASSERT fix alone is still useful, I can send a v3 that only
replaces it with -EUCLEAN. Otherwise I'm fine with dropping the patch
and leaving this as a report.

Thanks,
Cheng Yongkang
