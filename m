Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680E2449B0C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521657; cv=none; b=q/RsOq4pKezRWcsRi+F1h8tOTVqRax8Zlpdd7gc3sg8BqqjL9BV2NZ3IY8sckhNa9DzNXmqU7Bd23o+hBLxPki9SbgKmaUbyLoS3gGsBu7X+3BkX/q01jeU928qn3XhwZuV0cJawbSFg5AndrhWsMDIga9pbPOb0Wmx5NL5ICLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521657; c=relaxed/simple;
	bh=CbEhP/It9D/oFb8QM7UHMKkPIJ1B6rosHENrGcoKZaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xj3aZHNDJcDh/0rRecJyAz1Jm0xBuLgbtc9efeq363P7HATLJmko7GD0X6gdQDDO4FXDe6CfbQwvBOKXLS9/YC+lgHmPO4M6JTrUHLaS4DOSjqPso6vvXWas0/f1lwNnp1ytfMW8VW5keap6kjjZBmijUcjT94ryb0dJOwjYe9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEBIG8ml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEBIG8ml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368A21F00A3D;
	Fri,  4 Sep 2026 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788521655;
	bh=pgBxhDWgRJcbv9q58eKV5yDlgJoRS/RGLmSt/SUx3tQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UEBIG8mlU7ww1MfT/e+8PDc9IrkJ+SHX/ojswYPm8+NHEKBT4dIdlN7AY0c3BPhe0
	 wNiIVyd2gr6VLuDVUSOnbGfHBwoKcZ9anX4JwO+4ouBhxpcGfODzy5PJIAHr0xhIDs
	 couAB0rn5FPuSZ07bGtalWqE+YA1YjWTUBDy143l7S6smsty3GWXcgXF5jQAxFhtJ0
	 Cxa6/GND8wCqrAMuJ9EhZMiisJt8/ajdjt6rtMDD0Z+3/IogLs2ReRxnHPqfwj7Xfc
	 rjH6ZrixuUSOXng+XQQBgs+R+RfV2E99d1xtCshdnf4x2wwl7vqtLDVzN5ZzE2cDnt
	 UbQh+bXKoev1w==
Message-ID: <82e7a44a-7f1f-4f99-b341-8c468572ebbc@kernel.org>
Date: Fri, 4 Sep 2026 06:34:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nios2: fix typo "cannnot" in comment
Content-Language: en-US
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Simon Schuster <schuster.simon@siemens-energy.com>
Cc: linux-kernel@vger.kernel.org
References: <20260904111541.27932-1-hemanth.selam@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260904111541.27932-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hemanth,

On 9/4/26 19:15, Hemanth Selam wrote:
> Correct "cannnot" to "cannot", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
I appreciate the patch, but this is just generating unneeded churn that 
I'm not in favor of taking in.

Thanks,
Dinh
