Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3091ADC83
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865877; cv=pass; b=qVKg+J5TKv1aeL7K74DoBTx7k3AzewFeOKQ8kquE96F782IZWrWOO23WrnxF95CMBEEqdiG9BcHQ1DdfkFIxN3PVcbTtyiMGmDgNc462A8LsTb9oAd7mvI55q2AZpyH0eY4goanunOrqVRd47VHDAEy22cSTYlGpLB3Yc6zO7sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865877; c=relaxed/simple;
	bh=ex9vqOXbHvIQTl0dym2oWCgxiNjtgpU9r/i4Tj432cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ectW9KdAZGc5bJy5F+x9bd0D2CwS8bUI5Fbe4MBdkE7tHHPWDW8LDj31ja9vaJ5UPf44vn6nGhdcs/OUelAPy3m7VfZOxThClAhWJfGv+SKLnuivVKYYDwTFQUNLmnP4xEx8V0bXnXUOlsKL/Y8Y+e9P8PUOi7JoP4MOyf1Ej2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boTcpsoK; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boTcpsoK"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso369823766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790865874; cv=none;
        d=google.com; s=arc-20260327;
        b=V7Deb7BPkzeuUqqu6AW/335igdiovSM8E5hy9DGXXjwduXtzlO3vKIQEGDS6dwKQh1
         bpDRJ8iGCT4Qa1Jo4fSViroHi6fSgNLUOrnEJxPGb5T/tVVrC3XNH38WSmAXlFnS2iz5
         M48GYjCGKHtKWCOndaIaWpWQe/fFHyWj/+BdP0RnK0mZMrlj2Cui3QyTsN0BhCwPIg5H
         PMZwgB4Bwh4cfKtP/7/2BMajx6K+1Pppyv3pWw6updXQo64D9PCKgdnQ6Ze6CdNZu0w9
         5sWIPg2w3cIV+MDjRbxA0DUVGEjKEqPTiaRQsl9+B/EMRCBEw2QfKb157WHQyXZyam87
         tP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ex9vqOXbHvIQTl0dym2oWCgxiNjtgpU9r/i4Tj432cg=;
        fh=hMqkCTHK8+o/0tbajvzEfxrsN693i9Y+g8fDWt9ETek=;
        b=j0ikFId+GqsnVlmo6iOnw4/NQtH8E7JZEcYcSAYAH5Dm8Dln2yTQ4kGspWrTPM99lt
         WiiqZpYg9HcmzAKngF7QhIx5OOVqRSrvI2qwOyXS3ryqW5DkE9MEYlFD9VcNJBu3LsD1
         4fKlmrusi3jiWkuAdkieFjufrrY48GVQI/T16+g8p24SOGE8jMIEK+yTyhxT7FkCWPgt
         ug0JGtkJwWzYnfYbfNosiOfovkqV6k8z1GK05jj7AxbtvWWCmONzbwiFKvnN1Spxtxp0
         g99fWTRjySD79W97sHivsQdsjn3L2UP9FT+XznTkEeI5naQ0K7KojoNbwXW8c5NshZiI
         ujeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865874; x=1791470674; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex9vqOXbHvIQTl0dym2oWCgxiNjtgpU9r/i4Tj432cg=;
        b=boTcpsoKHiKCPlOPT8HZAEIm61ck1nBm8hsYPK7pBc0op6PbNj1SzeKupQ8FAt7Tsa
         PzKUkLYkQifagar8FTQpijmejSySYwcNd7FfLl9iwAx7lQfDkpT45Pq7dMnzBt3K9tZE
         nTJtO46/yojqIrS3TLj0wBrz6vGjCxFIANQTrEUxjbr4/KfPJlImaLbm/CA/rmyXzFmf
         B6/+7b42TECT1qgN/P3DPF0lQzRLeo8hYEQbCG7WmQ5IChyvfYEnmiGfxnravO8zYpEe
         /4tF+ScH+rSCMfhqs2UD4nzhF01CoS/oU3Af3bbhZh5fUdI/5mJQ4N0P5kpinNh6ylar
         UfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865874; x=1791470674;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ex9vqOXbHvIQTl0dym2oWCgxiNjtgpU9r/i4Tj432cg=;
        b=2IQCYWowthjzMR5SifSoCcFU1xQz6XIfO68WkzgvN3h04RLmpK0LXfTHicYHNZ8ofJ
         i+Gn9V3hUagN9xvMT+sX8EUBD9ciM7ltwja+sykDJaFZx83tRDo6LDFuuDaBwrXtiyy1
         O3IAiJeixlJlmL9NM0IW98w/QdhoyE9FKK7OPJDv+xpL5gOLMkevEun0a8kjOgsKk43N
         7PZTMlt0eUfBaTuh4EVOJ7FalLr9IUFR7V4Xi4xcVhiSIf1prd0zhZnhttYXxrbeUNAo
         mIcLkyJuo+Jyta2UluuE2SJbfi7bAoVQ9+Jq9hPJxK37Fpuo5sGgugilkT0+FnHTHpdr
         ghCA==
X-Forwarded-Encrypted: i=1; AKwUvBxPKi2ZANbmFsiCkB0cX4sEf2V2y95cHLqYWCt0+c72OzW6sKI8upsjPAOWwbRMjloBP3eCvm0NSJtbAxI=@vger.kernel.org
X-Gm-Message-State: AFuF++nee164Lp1BjAH6gk/jJsxof0rGGT030MsLktdlZPw4D6apBZH6
	zwL0Oj+px95pEpHwLu2Zbck2dbxbmV+vHf5XNUKb4rg8cHY//2jhWWLQPP/1gRpf0so3mesLeAD
	CB8APwsu89KcenexeHeCPOJap1eMjXQ7O+eqt
X-Gm-Gg: AYBFou3eX16kYo/xDknjkfcBxplBhKYOCaD52nbfki+ydIhnuvhV7ZqiRuF9GQ28oXf
	kPL3RlbbA4Q/3v+cYKqy3+i6/VPM0lbTq/IvxrrSs05qeihcIk42EplJAJx/sb83VYH4eEsDxkx
	G32Tc8hdPoo1yN603ilM+F4ltXeaFXlvc38UmlhmQoAuU8AsNzfgZRWwSvPOXjKmNhEEpa6v8eq
	VQDGxgHekA+sFHBeA/o6vMgOp/DtvvHLLb0MPvc+RBWL1hGkSMe8xww1iAh6MUKFx5F7NCHw3rf
	q1oWwtPIi0aO8GHIdEQYfSq47iWbu9tQydP1ne+Y8rh9LyS45ZhzT2FuOQ==
X-Received: by 2002:a17:906:6a05:b0:c26:1691:b364 with SMTP id
 a640c23a62f3a-c2e23d933b8mr415377766b.29.1790865873484; Thu, 01 Oct 2026
 07:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925205328.59183-1-yadavxashutosh@gmail.com> <2026100159-hacked-encourage-fe18@gregkh>
In-Reply-To: <2026100159-hacked-encourage-fe18@gregkh>
From: Ashutosh Yadav <yadavxashutosh@gmail.com>
Date: Thu, 1 Oct 2026 20:14:21 +0530
X-Gm-Features: AclHuK-OooqdkaRpmP1x2HWeRD03tHX4V87tBxPE0qLRSFMhrjyaVBYLYIzeNu8
Message-ID: <CACRQGQPXRaGLTXQ2U2kzeqgNia5_iz2R1XV1B6fnO6W8hSP7hg@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: add missing newlines in sysfs_emit formats
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 14:49, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Please read the archives for why this patch keeps getting rejected :)

Thank you for the pointer, Greg. I should have searched the archives
before submitting. Lesson learned -- I will do so for future patches.

Regards,
Ashutosh Yadav
