Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509226;
	b=R6SWB8cHiDwdEeKJaVOlYgyrAZrf/bkyFOtQW+GkuX5x1zx49wIZvQWPPc8YpXQviCIb
	 QrYryoI2U8M41kBt7TIXZlYnGAJxBQZk2z5BqfYAoyMYEgmbS5NNHIr/06QfLs6d7bm2C
	 B1gePSKZiKKLHVMRavWuZkbq1QDTkBEkK7MsiEC/RHo8pGMDR9U15X3YlRLQ1gUPbGPoi
	 6QJChakwmfa0cnskpklAiolehvMuYkJcRncJlJ5vaUQgJzSbbGjZtXWobAuPZlJK5uRNd
	 l/mZ7m+0Yd6UQXtvBPvhCyPsNX67l/lO4MLHk8Mq4okCUK5nI0aFsRLZ1c+5qhGVO1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=E5glhVrwj86spGywngXr0iRHfq7xQsmGjowFr/WZU4A=;
	b=sfGS/ftjGtTfsJW2HAHLlSxHhQESIf/ffB6pQGk3s/3PMXcvrvw36MpzCcFvpddr9wVq
	 xMZrplGxFY8rAnrBf3jJ70NTN2sVeND3syDaqAmPN3X/LwwyMc0vviM+X/o5CgVWp63sS
	 evy+pAxRG0HVambWn9kPZ6KoaudsHm9nqXOzjPMQA8RuSj5CDly7RuO3EgF/fSYTYONjw
	 /WrGySfQOLFoaxnVD76uJJ3LuPYIV0K3WWLd7yKAIpBFkj2doysutbtCk5s0Bj2VnL1q9
	 kixtqwENU/l9hrpZCa8vfI6860FDVeu4n26GV0Jhhtrn2ULaX89/qBfwthMUfhSdMXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="C/vDzz61";
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A2F60A2638
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3A2F60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C/vDzz61
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b3f7763d88so541517a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509224; x=1793114024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5glhVrwj86spGywngXr0iRHfq7xQsmGjowFr/WZU4A=;
        b=C/vDzz61rPXNX7mDqmExCQnBURVABP3blGrcJlLFnws13sNyQsJzyCTqcEDWeyQXev
         b1iehKcWPYyhDjou6L6ZqdpjcMVUYXQ8JlCwj91MCRkr0mo5t9vRsyTRs2bUV5lKJOL5
         VrmLR4WEMUke/zEM2VNxij1W0LUBsRPNwqAs/oCDodYDQRq6P3E8e+c21VIIDkQ1H7vL
         T4QoQmCPxsOcBdBaeKZ+yE89L+SCx07HOQUp0elFbUUf8JTZxrhBM8G+R9aEDrfyCJyq
         +oV2Gqx6WVMBq5Jtk0+tCD+J9i6Bv4smnBOsgcwAla2MDbVYLa+wt25XpM1ChOJB+CXt
         R0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509224; x=1793114024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5glhVrwj86spGywngXr0iRHfq7xQsmGjowFr/WZU4A=;
        b=u+nWFsPrCLWI7TycFTEFOrmCSmuIhev/2UJe0D9Ns2i0QEVqwDlQhpd83bjZb4W676
         pBApMs91b409RrBNWSbLCP8GBoZT81WtxbXiI2Pkze9uWvaqCkTPh3p/QeUlcbbpF/lD
         7l09X2gousa9OCwjEmO4b5Yi1zdKPC2BTmZCyOIaPqNxJudGIrMwCfMcPyT1U/9VrNJY
         ihlxcV5/ykmFszM56JLfrsk4LSvSNBqiDxiCSDcSBv2Ka3uT0EI+k8sBy7DTQ2YekzNc
         ED79nBfpIDW9zFxJth4lHUSTaz3fi5uVAGiNX7kTG/espJi277M8Jn7B7OhTQGIC1eMr
         n6Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxORH2emKEz5od9sDRp+JmHlUKKFDMFN7y5eZfveGw/5JOg7NAhakogvft6FjWKQo3AuBLdDLnhF1AeXTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYILdIIwlMqOHe8Z4WvuZRIJHWaQ3XkvaKUohTHKEEoP3+uyiZTL
	X5t9d2i9ZSouHzHNi+Q/br5ndFI6ogi8cAukmQuxFBDTzN1QojkAkhpF
X-Gm-Gg: AYBFou1YiMr4eLjHIjxG8a4ITMpblcPBaqjtBTxL5VO5L5Kale5wrsIAZi357C1+KvE
	+9p6Y+SYv9e74k10g0JWqQ/z2cUpyHtSfv/JZypQ5rcp745K2PjZ/ENTVFlgwu6VE0jTAfpbtbl
	Lb7/8oRpMvoMOZnAgfRMWJwrlM+ebBA1iFtmuquH9XkV0S6wYOuMDgG0K+7I6jQJA9iix+JeyCE
	5WeKO7+DW54eD57Xu/jqtCqpBGAhjWRP8MqfWWXBH5/HLHsbcuAz6AhRy++L4zG/cuwypc1KriE
	d/1mxPf08xEGSzkyqARu7+RKC5czzilO4YjUe49FFRUZt4+MaQInKS0oCTwIJ8W3ZBXIs4ZsIoE
	20pj7PrO6EflrKD03O9oYke8YQIlHGzCwf6nsLHmXCCCuDumxy8/A+1jPmXO4d5fD+UnCmpnhQU
	047uUdVHyQeRePj+pJQBscQD5BB1fSuMJO3uw=
X-Received: by 2002:a05:6402:c549:20b0:6b3:d0a0:3743 with SMTP id 4fb4d7f45d1cf-6b3d0bed948mr3136938a12.7.1792509223944;
        Tue, 20 Oct 2026 08:13:43 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b285esm5091427a12.8.2026.10.20.08.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:13:43 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 20 Oct 2026 17:13:41 +0200
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/vmalloc: read vm_map_ram block regions from the
 requested offset
Message-ID: <ateFJYagAJjvN8jr@milan>
References: <20261017125244.b2d7134fa9697b2982cb8cec@linux-foundation.org>
 <20261017231325.796986-1-nickolai@csail.mit.edu>
 <atSM69faDNgmLNVJ@milan>
 <atYRUyFHca-giQcw@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atYRUyFHca-giQcw@gremlin>

On Mon, Oct 19, 2026 at 01:48:46PM +0100, Lorenzo Stoakes (ARM) wrote:
> -cc slopper.
> 
> Keep in mind that this individual is flooding the kernel with slop.
> 
> We should be wary about encouraging this kind of behaviour. I suggest taking
> over patches, 'discussion' will likely result in having to deal with a meat
> proxy.
> 
Thank you for the input!

--
Uladzislau Rezki
