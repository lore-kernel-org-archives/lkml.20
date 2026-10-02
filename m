Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCD9481A84
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936122; cv=none; b=SyN8UkFbBIkcbven2otQKXr+CCuh9SchAHeOKDYjChbkHNpLwrVaorLBN3nxYcr2rRsJRr1zA0OyJiFHmPnbCyekHKcsHQzx3L1xoOwBgyF3zuNl72SZ0No12rud4sbdtlWQQmw6NbHWPfejXZuukuyNtQtOaPtBU86y1JVZ1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936122; c=relaxed/simple;
	bh=yAVhP8PsllXd5JMSaAqxyn6fr2wqCIosgODOdfksmGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k97o1BUIj489xaFyJA1rmIDbpU7FXXGAGwnxbZsIZ1nEVpr3+kd0UMMNo5KHOlfMhZKLLUgpgEbU311oGJw/+saycUjYg2qFrwrB+/tnEgn/xo92iESUceGsa1j4+Wmo7Fa/ivW+856eN++2VYgqhp1mtFQfdke2TKojE8M9kzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=hmQ2PF3X; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="hmQ2PF3X"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso77012035e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790936119; x=1791540919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhQwbNzw9q/i+NrTWwZM6JBPmiP7W8ERT5MTaCz339E=;
        b=hmQ2PF3XCIBFdeBQgJX8bRbz0CIvk94btAJ/lW7B0P/h/w2p4J9y1aEjX9dI50mKwA
         tsVz12m94Aetv92L35cFD7xcWqakXhuygDokkL2TKyguGQgjvkRC4SnOGEahwfIzLXP1
         Fqsqw3YBKArkFnCssRQj6srkUZRWgLY7Hz0xFz5pcoc9QxuQqH4hpMTMNYyVIQthO6PQ
         3xKh0SxOVU8/vRvSSaJeJVebWfBfX9QwvRsETXN5Amd0CGEiWlssu9ik9dw1yJ079Y/E
         qwUM24tjDMD8Q2ZBXniooTz5rh2obU09siswH2m3yp3ZYaEBUIESaS89M2Ykzf/7zfr2
         9I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936119; x=1791540919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhQwbNzw9q/i+NrTWwZM6JBPmiP7W8ERT5MTaCz339E=;
        b=jMqz6EBIxCoPs50zSQgtEehBdgBBwlrgeJXUvrsBGHyLQOb6AJaCGtLA5VS5hGuPOx
         nJSbrbANBSPH28rugWFf+/z2vg58sDtB9sJhT0cn8mrX/9udw2/BL4hQLH0dIT0FVq9x
         i7/6o8lTbIE0zyp3bMNk6WuaDoOvopoSXTJl4tJESdPfAdi6LRzUG+mvAQSoRCYR3Hez
         OrWbs2ZroTKBvttdXcNxf1CLgzqiox7R7O2Dy/NSAF8zaxX2tYaMrglg0cxv8KHLOMR9
         6llVZkfvhM25Ju9Rq5SC96iN7JEP8mXmLYQ1AQh9cd84CR8tHXE+JTZnCXbUowj5FyBa
         KcKA==
X-Gm-Message-State: AFuF++mbsBdQ1VXJnEdoqmJhOoBG0cozFavc8eSZBH3bTeN4sWy7ukDT
	zyZR1IQVMkOuixECDciqmz4gdsvTD9velCF8heds2jE5nBrpD4NNUzErDxfqE4bwTiM=
X-Gm-Gg: AYBFou1HQi0MSxvbOirqWH7wn/p/4mrf9qloVy8ZTjrFrobphHwLKeqoXIlP5sXNpFb
	saeRtrG3yXavTfpa82YULHiOP7Y+n9oAc1d7LnetZqJnyhpLjrb0iHX2RbYSmjlrXegX1AdNcFt
	1mXIYyX8I4BNNOE1BBJbjvuh5q0GdfCkIGdcnMkPjkndLVMW0ybh58SakeTxTpPgQ+lccRDkxeX
	qag3myBj4tH8/hod3nAY8vTjjuE+IsP1qJ+InuXYxIL0Mn2+HateJO797zuRMvN1Xju6haEuWyd
	laMDsK+sormu9lC6t6uaE6Odx5UUHz8v9yPGQVvR9VZYRcP9PIoD2/ALvicnwiqT0Xpgv9AIIN1
	2ZfLvwPFSIW2bBTo1AQ84QFErJaW8+fbJDFLqsqy6SQwAtg6Bi8gALRYy9G4eb/HBIkcFqL4u0H
	Jjjh2kc6gtf9/P6Wa2iiUAqrGm+C+gzUS34cVFqcIu9H5LW1W56waC/Gcb5DLzFYlwSAbX+VxOq
	dF2WA==
X-Received: by 2002:a05:600c:8b2f:b0:4a0:f0a:976a with SMTP id 5b1f17b1804b1-4a027579f41mr39944895e9.13.1790936118308;
        Fri, 02 Oct 2026 03:15:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:adcb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm4990029f8f.26.2026.10.02.03.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:15:17 -0700 (PDT)
Date: Fri, 2 Oct 2026 06:15:16 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	alexandre.belloni@bootlin.com, rui.zhang@intel.com
Subject: Re: [PATCH 0/2] rtc: cmos: Fix ACPI RTC alarm handling
Message-ID: <ar-DmqHQNJ90HZ55@gourry-fedora-PF4VCD3F>
References: <20260909225132.1392883-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909225132.1392883-1-gourry@gourry.net>

On Wed, Sep 09, 2026 at 06:51:30PM -0400, Gregory Price wrote:
> RTC update interrupt emulation can stop delivering events when rtc-cmos
> uses the ACPI RTC fixed event. On an affected system, a test that waits
> for five one-second update events completed only 40 of 50 runs. The ACPI
> ff_rt_clk counter stopped at 218, exactly matching the number of events
> delivered to userspace, with the event status set but delivery disabled.

Gentle ping on this.  tl;dr: in-tree rtctest is broken on some hardware
and there's an obviously boot param fialure.

~Gregory
