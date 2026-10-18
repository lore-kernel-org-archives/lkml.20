Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888462765E2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321586; cv=none; b=GEot1NI1Ga2p/89MmqrTz7C4AQvxOhYX2vL5u0EfrB62smIVMRgmx7KsZjGM7HbOxGIK5SDd5TXN50ZKC+1adAhnMmUpESOrfRh4zMRRW+92/17cVUie8Si+Ap59oqWbzNKwVdUkL/3BQgLmSQvWl/pZKfgzJT7ZTKR+e42oYuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321586; c=relaxed/simple;
	bh=SMkplYX/bMvj4Z0t1+tI+g2pU4wIJJenSUPdT7OGtf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buJP5BVyKxwsbgjLrKbmPEhBZE0SOHtLsMjpRiqO3Hgv75yTKSXlnpBcx/GNXkhFM/hKEobeABxzqkc2Puaf9S4FHpTGQWhtHU3r0cf8dqD/Uib6ckTX6MkIdl3LYijXwZCth49lgTIw5I/7zLaq1LlNGPboqsmmnewjE/WsMuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGKX8eo4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGKX8eo4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e10a70540so167604f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321584; x=1792926384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGgqpUIm3hiiqmlP1271dLLo3XdVxiAKvps3B1o5QAM=;
        b=bGKX8eo4JDb1/Fvihh/Ast3RmHiaBQdnh0C7gOQcePVt1a0041NYtRjNDNxpgjetsi
         FPNR6OIH9rA5Wk0cZCdiWAF5OYBjX1qf695BcjDU2AzqbXNkMN7ZPkEpOeibolPaDJkO
         qe6H3A8JIwCTuAp129Y9GiEOAU8YjqPz1QAEIu8/zYDDcuOVe9bzp/iwUCv21OlfOrYO
         pLLvofQT5yQtbPW3tkt2hMLPNFNVFRVAd7wrs/i0p9liPR9nb+f3xjkC2eriYstG/hpt
         HYV4Fv/lxq6bKsgmXlTp8S8tPpCvRBFInVbd/PWI2UYV1hS04F8Dj+EXxkoMzj7VkGov
         4oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321584; x=1792926384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGgqpUIm3hiiqmlP1271dLLo3XdVxiAKvps3B1o5QAM=;
        b=zG4YRWVdqQ+rJPdFYAsuHeIBTFoyLdeq9HGtQY5UHmD5dOdK4U4/9eILbSnx+hpjPM
         HU1XCBQM0iEWDUQcRRVL5XKbOBaBUiLe4kFgAoU7wVZyi54T+l1c1eKd/WUd228TK+Bg
         5NELIKvizQBEmy7HJkjCt+ZCEGKexJs1Mj4btNhsVbxfWn4TfWc7LIlpB7hVRL0sR8Cm
         vKT5lcmE3hehjEmsW3gNavNFV5Rg3ZXrmWjQph0DAlFa6gGjIhpvNnDD2vx0jOODqJZA
         zEj5/OOCDb42eOldvFaTzfLoIRROfwEaKsUhpJ42jx5uzL7yP9NFCzquxklrxcJZ1QNP
         skqg==
X-Forwarded-Encrypted: i=1; AKwUvByMyqitkCvVv8xh4fZHh0imCWU/ZR1ZRbxvRYs4bwQ/v2ENA/zxCHVIRYpArKkP/6ZMuLgcI5bpz6nOt9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJLeV4++Gy982ee9nJgWMZPj2BLalZrJ8qQV+ingsgm83hcF1J
	9u1fhSMAXJKsSQ1b4KAtypgYmgD70xJQrk/vNe4q41A22VmfSpUBK7x7wFuMa4Sr4CPkQptZ
X-Gm-Gg: AYBFou0LvtJ/Tt7ypyGnfqx3tWGlJjng3qoWmrnMLtaP8cV8Pwrv2j+oRvRL/tNCDo8
	1UiafnROEmyQ8lreTG83++lnYZ3A94e9tVwIUVmMyvfQ/RnVp+NqIaBq4roAufZdTB92/0tErFz
	JzjQcuPsDkC9SgSZ/Tgl1WmJ00J7JpBmYwMew5HWyHfgyG4q+1vs6+Az0etxWeuAk/Z3UtthCx2
	39Z2poj0YUs7zkrZgKxSub0N80llrltl2T79HowRoyiJkpB9BtImmw8BiDx9NyrukhKMvLoulIV
	0u/bq7wOCXi2W5dlNj29EGcQS62LLsBNowdSrkYJTqrOc2sUafhWXMWCXxFOk3qfZthHH3Blxyh
	h/4kOvx38JZgMlRpW+Sq5yMUIJnOgefGrVe0CIURTHh3x8/Hms993vi+T7YCgW1WDtYidry8s57
	NxBdI84g6wr8euXFrx05TMxbeuwh9uTsv1lcVJfkF5hMu0mPO1IrbgTEfDdiIEseToPZ31farIw
	fSSBw==
X-Received: by 2002:a5d:64c9:0:b0:48c:490a:336b with SMTP id ffacd0b85a97d-48e07976ac1mr10093265f8f.5.1792321583508;
        Sun, 18 Oct 2026 04:06:23 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm16578122f8f.47.2026.10.18.04.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:06:21 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:06:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Melih Emik <melihemik@noirlang.tr>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: remove redundant dev_err() calls
Message-ID: <atSoKUqHquEhdTXa@stanley.mountain>
References: <20261018104223.164776-1-melihemik@noirlang.tr>
 <atSjRzJ3_ORJ_uh9@stanley.mountain>
 <179232125059.295089.11354359693726377618@noirlang.tr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179232125059.295089.11354359693726377618@noirlang.tr>

On Sun, Oct 18, 2026 at 02:00:50PM +0300, Melih Emik wrote:
> On Sun, Oct 18, 2026 at 01:45:27PM +0300, Dan Carpenter wrote:
> > Don't put this kind of meta commentary in the commit message.  It's
> > expected that people test their patches, so there is no need to say
> > it.  If there is something unexpected then put it below the ---
> > cut off line
> 
> Hi Dan,
> 
> Thank you very much for the helpful guidance and explanation! That makes
> complete sense, and I really appreciate you taking the time to point it out.
> 
> I have updated the patch to drop the meta commentary from the commit message
> and placed the test notes below the "---" cut-off line in v2.
> 
> Thanks again for your review and time!

Please don't send AI emails...  It's so depressing and cliche to hear,
"Yes, you are right!" from an AI.

regards,
dan carpenter

