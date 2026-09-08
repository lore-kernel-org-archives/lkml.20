Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7DC583AB8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885209; cv=none; b=C+7R31MwbcVUcgG/r1OWJUlAm9efjDiRUnI/AtdVxCgaZ4TVabaXkBPg528X6LS4RAojTs/uEm4mTKtDVOwU/G8og7lHiXO5Tl0QeqqK+yMMTeeefTn1HXZgJy5eapJMCs2ZzQw7ZXRbvbOEGT2/d+5PriCpJWEQHuMdsMWDhq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885209; c=relaxed/simple;
	bh=yBAnOHQn7rPSTJL9LuORbc7lDrVtXUzjk+vsXw73QIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Io34uu0jAdb5E3fJOqYWZ9PnzZw6xLN+mnGswyUo+VaBuYLrR6EdHpGTQAF5qyB3frbrrcioVkqlKhrhkEpKQmxuTQWjMW6CwbVzaeZL8zkx7d/bwllxwkDVkT7UpMq8wj3H6pHDqQ4+ndgkeS3jvXbexIr2OidJRCFaDnkCPGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8I1n1lU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8I1n1lU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6d28aa26cso29922175ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885207; x=1789490007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HCMxOpzkPWvwtPGSWgpMXMCScuJYEjTiRbXV88KqE5g=;
        b=s8I1n1lUG4fAKUec3yJLTF+Y/Ewm+9uAmbbp/6V4d7SLYTD9kn6w+PgXdwG7ri6UQ6
         2bS/yO/jijYbtCIxz+jsXz7hvbNwySGoinDPgnIMqSan4a2+7L+uJxq0pt7fUN354gSw
         Y5Ukie10vtJA5LS0cOl0qscYyHa3f+bMLDx9yHDz8sBk6GpLB9G4d7PcJUSpwn2d24xS
         aD8x5wPZrxd2RqKymFByZiN5kyyfb/ykeaLqsYDv98qcnEv0HraWm1qKm2ojfRgLUEfd
         ZoGZI2LRmrudCu5Xo4vPQh2yrGuH+O94KuSp1uJ6wmH7DT533PVW1J+39aCyrU2cOIRk
         JMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885207; x=1789490007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCMxOpzkPWvwtPGSWgpMXMCScuJYEjTiRbXV88KqE5g=;
        b=a5XO93tooIjRvamFxeZEyNAlj8gjGvLOuaASk1O/9cZFbesOUkT15X52TpENwU/le4
         oxPJeoHw3xWHt1R0atPGYt7fR3VoMcbgd7ZIm2YwiFTR0lqjEcccMBsAljkJJ6G2Wv62
         mOjkYS2Lzm/I7oLRfbCwYe8aZ+FUoSBk6pVoOMMhSdqso/a+23cdvFJY85fV4B2wJp3F
         ypmyMcZs4WgNNqJlVJUBSq+o53oJbkoGZTp6LswgNJNMDr2BYDR2JVom8418lP1Tszxz
         SutySrff0+JfF8WkzTH6NceILM6Befu0IVODqxNC1BtruzEBxXHDGawyUNde71WTCFao
         Kg0A==
X-Forwarded-Encrypted: i=1; AKwUvBx5WF18keo8nqRtYxEu2qnrioS25fmXFK7w/QUKJlEZj1tvwatg2/SjIrMOKEFBmHvp9J4qDVQW1UY9NmY=@vger.kernel.org
X-Gm-Message-State: AFuF++nHvFBwYU2B3nOxxdltPWslvgsoOtOtkSrh/imaZy87edCLFJ1w
	L9nvxg7LOgYBevsX7xv4zXMbZ9GAApCiWyWfj4LWsgRGtw34rmVpeFDO
X-Gm-Gg: AYBFou1fvhPe0WaQUqzTFQYW3c4cggYlsfubSUXjU299gH/DfZGZVUtGXBY65/+3N+S
	URGbo1oXq5+Se0VPifFXjQgxCfMmJtKRmSNAfUnmc7vGyDwF5Bae5XsivqLhEa6PJANLqjSPuHB
	Jp6YZ1+a8NnvudDcne34ZK1hddqKiT74JExcWeGTxfFc/UztzO9Ls4L7tr7GnB+Ak7I9Roh5iS0
	a0WDafSe989eekDJF6cmSdRoRS91EuiAV9wJmXq/RxJTjfFXGmXrrmccwnrVVyKraYmvb9XPDE7
	7Z+cTwAnCl2RMAuDddfOzE0I63X3QFGqyvMXRfYmFNZdLv97sIb1YgleUsUq/tWQJ3NN/8qdgOL
	ZFYBMMCxa077cA2Q30tZS9+fV+ynnmvYmBmEAyxW6ta3fQmSDqXbrcZ2JkStjZhConqwC9ugmec
	mqPlUbrblt/2iCpI6bfwfkBLvIcPhR8KgNfp0/civ6p2SzSI7x49baQYwb/sz8u+d+n6vN2GfWE
	Q==
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr41111091a91.6.1788885206711;
        Tue, 08 Sep 2026 09:33:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26127fddsm26725619a91.12.2026.09.08.09.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:33:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:33:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (yogafan) Add support for new Lenovo models
Message-ID: <a5548d73-a923-4cc5-8c9f-d7204028bd64@roeck-us.net>
References: <20260908094931.2227049-1-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908094931.2227049-1-sergiomelas@gmail.com>

On Tue, Sep 08, 2026 at 11:49:31AM +0200, Sergio Melas wrote:
> Add DMI quirk entries and map correct ACPI paths and configurations for
> additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
> and Yoga 740-15IML, leveraging DMI product family matching.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Applied.

Thanks,
Guenter
