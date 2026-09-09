Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EF53D6CD9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990526; cv=none; b=KSV2Fx84n1R0uNjw4FSiB8VyAaJzhln3S8DGeUNyIKzmVjHw3Pn7TUN4nT+D6/sPe5MF319nCRoske/T2zHhUZePPXwmsh3eUZFcz3Z9sLJf9yssCcboTEv1KIOeVoQNCjM6MkOsLw/TqaN/kjBEYaQ0JVsIPCZXenxiBLTVP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990526; c=relaxed/simple;
	bh=SSTwEHCWAc+P5g44mSyZbT9L1Ie47uSnjWAmoKDqiVw=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=BrRVKQWksSAmYote5X5iLD1A5pDpf2VwKK1bfh9fBx2qo3KrBrtERvNDd54tTSuPvXJY7dP6g1mkfeNn/UZxJ8ii2ban5+p15S1fOxWlsDZQMAhvGPqOpBMwB3yq4Wrh3FuBMrCTVSJVwmPRmggBhN0gXDS63EAOXRswHQ58nY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bcyArZYq; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bcyArZYq"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-910316a2fc9so79507856d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788990517; x=1789595317; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWlaXXsiZZ3hxWAJkSJI84Lovlcl0MiT9GyGYtm/owE=;
        b=bcyArZYqhEec8abeb/GPGfpTZ3GKiWJE631k4CpaFSKMfgxO3nw/KamJHwAYzPuLxS
         w1NYiGJAI8lJ4l4BdPWvJTu+D/2l40le9cFNi2goniJJjZBc6hibiR30Ww2bSBVL9o0E
         O+nOhfgE60RLjaKC0t+JeSmiNo3Mayg6xu0GWdy7mIwsFuQRFcqGl0vEsmcLomAUSP1T
         nE0l7OkYARftuYFLI/iqE1L0suwKjBXdA4/ZOjoI8rNX4tPDHWZAGXuZMshQuSZA5QH6
         xEAPFqCjaMULxsYFaeojsumQZIO6D4ml8SzpMqlmajhrJzaa7+7nGTOUrqEVteBb6MZL
         xsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788990517; x=1789595317;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWlaXXsiZZ3hxWAJkSJI84Lovlcl0MiT9GyGYtm/owE=;
        b=iUIYnSrpsSHr0a0PClZuIKSD4Xzt29W4uVggA9MFzTEptdjQgdUcFx1BGZA6bo8vwG
         KZiZV1QosXlAviK9O94d7YfikxIgJE5E79U7j7yKiSeDbUlZlQ4xPuo4CSemCzIOtwsK
         fJ1lzCtoelrcwyRaBdA7n27EjEcdfRATcEb7kADQPdmUNHfPGRnYobD8jIVvMDgFPOIY
         YmUp2Ye4tMw2P4oLzBAYJPmH6xh0sdrlnohkc66FL9SCU8hMa+Yj46NcGMr0Mk0pGGc6
         esqxnUh5VOi6c2qGWPT3vLd9zpVvpIJ2E6SszaF2/q9I55XO4IDc6p/o+zPV9BPr8M3g
         36wg==
X-Forwarded-Encrypted: i=1; AKwUvByPQyv9xjkVIzdccnthhfvxLsMcC3sFmz8GnVAbbBmrZPsc0YljxwNJCDJ0+cT3/G2BuLw6ozJnUif4Xhk=@vger.kernel.org
X-Gm-Message-State: AFuF++l+yRmjox5R4hSpVwNMAOF88PcSO1noBcACB7eRx+ncpDTgkWz7
	G6IpPYWJj6fvr6dvAveZEt/YWQBRgXNPMQhBum+Ucd+mXHS/rSDkFofGJ4DV3m9uog==
X-Gm-Gg: AYBFou2wO5Ynh945jnwSD6GsA+wL5iWiLZEA3L72qHx8PEdWFr46QM4pOkzjYP8/773
	xh0KdWUlG6BvUzQc+5oQu/FvkvavTPZjAmvyoMhxqfcrqKwzTBf7ncb9k6Nk2eIyra17rHoa+oF
	d0pMWiquLLKDJ4l9NM0oaAJW0s7L8FGBNbGvmqPOlo6hLqBeytVwdAR7fqvQSYzRvOvP0eS/D/e
	PvzP8s4OJDymocsCRdA51v7pMvY8hYfcWHpkY+7syzEs1F8TzbbUDUBA7zH2NtNs7Tn9qWvb78q
	Vm40PIrxop1zF1tpEFUs82M8+hEEuWr5r2G8If8Sw0LHrTKMWJeg9dDZ9aMI9BTxXLDDgShk1d7
	yxtaoupLZAHKkka36i1ZwDQrECvvhkKaWrUAvF9hg0nOovThdgayRNl3KIwZekl6eVk3FfUo3cL
	OyrpMz0HqhqF7HCKU/gBaTo/7hQcDKb9RfTstM9Gvyxm7KvPj7CiY2uzAhBmnM943mMoDQrebyR
	yRYwtAQGjc/XeVRpwVUKJ99xGA25fWVuQi0Lx2ctC9VR/Wh/JlcD7J8oypz/cA+TkCsiobxwEZt
X-Received: by 2002:a0c:f00e:0:b0:90e:9361:d035 with SMTP id 6a1803df08f44-9103ef8d87fmr444413406d6.21.1788990517405;
        Wed, 09 Sep 2026 14:48:37 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91203ca1063sm2439906d6.5.2026.09.09.14.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:48:35 -0700 (PDT)
Date: Wed, 09 Sep 2026 17:48:34 -0400
Message-ID: <5b09aa12a73fa955c49a4499dea6866d@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260909_1743/pstg-lib:20260909_1550/pstg-pwork:20260909_1743
From: Paul Moore <paul@paul-moore.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: Serge Hallyn <serge@hallyn.com>, Vlastimil Babka <vbabka@kernel.org>, Kees Cook <kees@kernel.org>, linux-security-module@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: Re: [PATCH v2] cred: prevent slab cache merging for cred_jar
References: <20260611070054.6550-1-med08elkadiri@gmail.com>
In-Reply-To: <20260611070054.6550-1-med08elkadiri@gmail.com>

On Jun 11, 2026 Mohammed EL Kadiri <med08elkadiri@gmail.com> wrote:
> 
> Add SLAB_NO_MERGE to cred_jar to ensure struct cred objects get
> dedicated slab pages, preventing the allocator from merging this
> cache with other similarly-sized caches. This is a hardening measure
> to provide type isolation for credential objects.
> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
> ---
> Changes in v2:
>   - Collected Reviewed-by tag from Kees Cook.
>   - No code changes from v1.
> 
>  kernel/cred.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into lsm/dev, thanks!

--
paul-moore.com
