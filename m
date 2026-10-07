Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4094287247
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391971; cv=none; b=mSTYW6odv9OLi0402iDKwXE60QalyW5S2BbcWKwjs6oTeRFOoAKD7xR8muZ0zh+6HBnitiGAAMp9zcTntTRPf/8ucRzc1LTluZfOao8AJx4HgAJCLhoYRBOpJyWYxjqniqZ5LMT63cg1WuG0muiGlzyHguA+IKF7jJ6vzfvZxCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391971; c=relaxed/simple;
	bh=dqiDKQ3N/DnpHnsdMoeri0GkL+4tP1zvDHNYHZYUi6w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0/PBQbvWN1MoeZjVstS0ZbBicQHlJFP4lkyvcufiwuMM2sYC5RDtEeQ2BUc3u/rMBmjLQBsHM9DFXyJY6hCCVfeifyCPdBvItYO8No0mIdEZN6y9B86iQaCjsX9c/IwgclXWQXeLsEYIRB/Qqx2iwKFnEGQrRSHizfSmQcE4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGpH+5tX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGpH+5tX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so17715895e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791391968; x=1791996768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V/DJQm642ioSUFAhNgei0DATnu2YCVh0eLeXztaTK8U=;
        b=jGpH+5tXJv0rT/6XxzHBAoCPHwA0NPQXwuSeAN1fDwyw9PbNDnMDtlh5+jAN5HcjuB
         KOdA0bl82ftCFTucFD5R6LzT2JrrXbRaseG+UBRIWvaQQM19lIOtQvesA+fn5118AR9Q
         MyXSBR6jElxsVxXUbAcQA1QHkpDtE5UXruS/csvvLIzvydv2+cjFLZthiy37q58xL8Em
         O0nXIZge6GARCnzca+CRSPEU5M2ZcCErzIdsvSs+R+njO2tA1VvAibevv7UiJyIm/bc9
         7vZKWuB/j+qib4NywyLDcZr85BkPRee1kKIvNFxwiPW5YpWNVxljQHN8h8Vo+EwMw2ph
         DPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791391968; x=1791996768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/DJQm642ioSUFAhNgei0DATnu2YCVh0eLeXztaTK8U=;
        b=2fHNgJ5+FjQADlLHSSGPfJLJ+Pn6MydUqIbPrppiwFjgXlMBGoXUTQ5MKqpTEJKBD9
         JZWtewz9sz1+2CrVTkEva4eevghYhZokc5RC/WYJaRE54vk1yg8JhNX5YrECA92S93Io
         I7hz/Do+/v49QdTLxseVxN1q2O/dQYglvdNY1T7TJn4i3G3g8OcBCvhzzpXiShxORO8T
         dQCyM5zBpGz9aH0mPGC3NkH7owtfFGsYbxIwzsOO4iXaUSoJLnXHb4G3sAhNsBBNs3R8
         yTGYIV5TmuXsLVKnR6x6V0klhEKES8i4xLNcUOS0aD+YLCe0QkbqMsMKm5hcyK42Ehol
         s+VA==
X-Forwarded-Encrypted: i=1; AKwUvBy1bOrBmNp8+G++oB+t8aNWO8qY+TLkYkDWxs4fBrP/HhvP+7YFVSf1/Hhgsv44wfXnvJzFBN4Ot8q0qUI=@vger.kernel.org
X-Gm-Message-State: AFuF++kEH/PHnhXFQCJv/1bHj+tUVs/RP2MifIz60C3hsfmvDBgULUFK
	5+M0+RSTfwGpJtr+QNClwZmGXB59BQhBzxdBU8v+Eb+KbmXwpgdKxRhm
X-Gm-Gg: AYBFou0OoD7ZkF6qGtiCFNUkMH7GPu80JBD06PjQqrabaCsolUxEVQy9O14PKRatsH0
	laKP2ZxXa23Knzf5r1WGHAaOVhTTqAK/c9B56f7qE+A9G8BRjN4E6bkgqNa/q8Wtwymj6MKNTkL
	rM+jx7nVsXv7DOQViZUn6vkQSVnjd5yx//RpkeWou6RzYdhfyHpnVRb2z0CICW64BiqD5jDJwI0
	FPPpACuoES1N8cFl9J6Yluu6J8ebSd4JzY5VYX2e92LCau/g/4A46hiByAT3MIP1/Lj0NuMTkhZ
	W1cWdyUJ+if4nDdE86RbwjwYkwwj8oxhLI3r3aGX1QIvk6iA6C0OTl39Z+AgG3wO43tkbA891zh
	HG15yD5HG/Lx1/yTy4QYLwZFyOb4xu6zqZgx4YWm7EpSEp1OkN8ZfynwlJ1I8w0seM3ynftOuMJ
	eozhb6uN3au3IA98/U7KPhaYmrUC4CynbO6xntmTusgn/YvNDf2aWlcxPQ6CGpaX0CLAv2m12uG
	AfP38RWyDARoXbEGRMbtfHCOLnitMMnDOZgKartGN/78MilB/eytd2vkMvmCX0X6sobHQ3nS21G
X-Received: by 2002:a05:600c:810b:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a180455c6bmr47420595e9.24.1791391967712;
        Wed, 07 Oct 2026 09:52:47 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843a9cecsm3984045e9.7.2026.10.07.09.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:52:47 -0700 (PDT)
Message-ID: <6ac678df.04a8e9ff.23fe56.b815@mx.google.com>
X-Google-Original-Message-ID: <asZ43M8a6Vc6R0cd@Ansuel-XPS.>
Date: Wed, 7 Oct 2026 18:52:44 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] checkpatch: report warning with files ending with
 blank lines
References: <20261007122837.2995-1-ansuelsmth@gmail.com>
 <e8ef6959a0cb7093cfe4933da99fdfb5567f5354.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8ef6959a0cb7093cfe4933da99fdfb5567f5354.camel@perches.com>

On Wed, Oct 07, 2026 at 09:49:48AM -0700, Joe Perches wrote:
> On Wed, 2026-10-07 at 14:28 +0200, Christian Marangi wrote:
> > ```
> > On applying patch, git, depending on the default configuration, might
> > complain for any file having blank lines at end of file.
> 
> I was not clear enough in my first reply.
> 
> I meant that the test should be done only once, not
> for each line of the input.
> 
> After the end of the process() loop of
> 
> 	foreach my $rawline (@rawlines) {
> 		[...]
> 	}
> 
> a single test of $rawlines[-1] could be done.

Yes I also was with that idea but then I quickly figure it out that we are
not testing if the .patch have blank line at EOF. But if the single file of
the patch have blank line at EOF.

That can only be done in the process() while scanning each line as it does
progressively check new files in it.

(unless I'm missing something)

-- 
	Ansuel
