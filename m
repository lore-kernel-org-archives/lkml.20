Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060622;
	b=3RRYXAH2G8lUmWJ7TEyKItUn4Ljwooyz0GE+IMixKJrK73LXl7t3WT9AsP/6SFADAuO/
	 M8N6bopg0Ct6+fmLBXKurkTaiYxf63Ag9e1DXcS9F8UI5GHHShz9VhSdrxFJ6apUgJEo7
	 hvZMF05R/a3hmuGNzhC4YDAXM+ANC+rBinv9ECeeEtFl13DSioGhEuZ0bQ6oj8EZMhKp1
	 d+OhKmDhCfm4wT9kolbpzXcoJpVYH8BSQzt3T9sic9z3bHZeMq3dtgiaMzvLNLjqx/UTn
	 xSqYiohFC117oe6LItUEcHGKTtfqY0mT0GSNRDv/jmho0SNqriswUObSCRJqwJxozkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0Oer6OZKK3H/7K/HnFhlDtT8h86r03JGpz0+RkaxxSU=;
	b=Dtfm7J1IREvtfJA1fAUV7EuZ0Nx3pccgnN05vFimhwQSgjuEbjvwtB9vBJgjZ7mp82pW
	 2sTUJU2eVBHQp+CgJ8x0q0WmjXkjq0oKKm4sION2e2g3HKEWQUyGK60nrInO/NkJZVRQX
	 xOKSvs2nAUaVEleQo44btknMHRgioykLV1xX0jX6e8/yGnTQUok72DcFUSXJpwrEBUWI0
	 cIy0z8uXLnXj/Hr8Wgn6dGm/Rn0kEUZmETFUUesmEqSNy4nm3yO2nyzHDBCwrbPBkLbXb
	 Ty6yIcOKptydg+Ves8NezKroQ+F6dx7ii/XMZ82PiKzWYhC6hn4eUDPEnd1fBY3Q81A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rNTiHsc7;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BCA606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BCA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rNTiHsc7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so5538562eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060621; x=1793665421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Oer6OZKK3H/7K/HnFhlDtT8h86r03JGpz0+RkaxxSU=;
        b=rNTiHsc7+BL4GOfsfwXTyw43UO1OKrB3hTtnrLuxBKY9llscWEDcv5LGNZgo+xEVMj
         nOtcVepPgjiQrurwlepiyUqr2sqQ+NWCrtJTWm5pCDHPUEt9mmpgQQyshud1mK1LBsu1
         9qh5sDFEGzPA0YlTwZrAT2fqb9CiUnW/ug5VDcFaAjcBJm/6O8Guh5PfEhwsvNNBe5c+
         3ebJ5ltWBSc+jUgoj7SaJLT3lnpyNldl3eQy0k9pGT/DX6iIX7r7qnrQuA8noesABUsL
         BN0OfkwM3pHvMndLC4DwYQazVLYoQhRQO+wV6JAboa9qkV5WedNkEKgv4SA0wWx7bLQH
         vJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060621; x=1793665421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Oer6OZKK3H/7K/HnFhlDtT8h86r03JGpz0+RkaxxSU=;
        b=nXNOOtuKGZe04GZZNN4evIkXEV2QkDeKmcCQoV3Zb8NcAGr+r/o1357eDhnW12hsGf
         CuLpEmwZxae619OnYqWsYc7H6TlplP0s44S24BbwkzY8OD2AHjmeTX8EGWetLxcXU1pK
         QtvxMLazuDPCsV4EaHDvPMYYwzxbFrgSDreNRLqmvca2B4x20Spes3TIkaS7geaUTErI
         0tMvM49H3Q54vU3Joairm91SgbBwGa2nfnT6znejsno0JExIQfZ+WT78YmcXVwUKTeiD
         qiStQMV0jZyJ43UUyjOYKuwlfv9vJ8givxbs2Hc/W+tCXHCHTfmPvawc/TtdMoQLCQ/o
         wGaA==
X-Forwarded-Encrypted: i=1; AKwUvBxqCMw+sSSMjLvmmerzhYvR+0//aSP6yKaHVIEB/aYvfIu6KxRqLbME3RWA6ICmnK39QF9h0SaICyRbzMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhL1F1m6KSKgPKSvEJ89T82TOZdi+42970aHA/WCOB/wKBRNjC
	nRGuD2SxM+R9Cng0ZkZdC4jBKtXwNCg2/69UD2AeMmoqv1LUcVFv/mPLCEXxaGgV
X-Gm-Gg: AYBFou3PEB6Sn/fq+zGoKZKd2evXaSl4qJzyl8GD2nAP+yET/He9KmUgtuEv1N216Ys
	dP4ckTS2hO9139qslfzFbClmWniH0yS7owT+2B0fs82Lxwxo2NLiIH48dDPr1DjwHx47JRIRCMk
	inTBjUy2ANRWROYTsosDYMq4R91z3f0kTfd+JwmM2ajILZq521ba4LO9oyCcQVGBjOY6wcxvBve
	qG92X2xTr4lVIqybojmM2776/nFuEaRPs1MhAt7ocqMhCSZJcjpAjNvMGiZftFTmh4biu+fbjvj
	TxWuO/AwA7mDof7E4/M8ek0AXiIbG36Yt2LrfDSZ+zCeNtAGEbG/u+qDNl7IolzxHqyTPmEQHSI
	zcksNlxkWQjL72xzpFFAZ1SxgUOdnI4Mogh7O7zYhUzuQOgPunhElB6tbmwFbg7WEYDTx6YbIdY
	wOL20oOBKKDICzu9fvX8l6JUZ2uQyeN3k2uPETkSpoQItZbtRAbqQ3dyvR4Q638dKlyQPD9e87H
	Gmf4dd8GGIRd7+FzqCjpN0kNjODVks0MSWv+YjrFeHKhg==
X-Received: by 2002:a05:693c:66c2:20b0:369:efcf:2642 with SMTP id 5a478bee46e88-369efcf2862mr10286088eec.31.1793060620528;
        Mon, 26 Oct 2026 17:23:40 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm36683836eec.28.2026.10.26.17.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:23:39 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:23:37 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: Fix error handling in __ntfs_create()
Message-ID: <at_vCRaW7SSkAKN6@hyunchul-PC02>
References: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>

On Mon, Oct 26, 2026 at 12:43:00PM -0700, Bart Van Assche wrote:
> In __ntfs_create(), if ntfs_init_acl() fails before
> ntfs_mft_record_alloc() is called, jumping to err_out frees MFT record
> 0 ($MFT), unmaps an unmapped record and unlocks the unheld
> &dir_ni->mrec_lock and &ni->mrec_lock mutexes. Call iput(vi) and
> return ERR_PTR(err) directly instead, matching the
> ntfs_mft_record_alloc() failure path right below it.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
