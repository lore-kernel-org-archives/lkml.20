Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD663AAF55
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256568; cv=pass; b=aiIBGGEQDtQ9LRRxonPVF1DOTR4mdG/y3QSvNp6vwrADjNq8IDVAp7O0xOklm6DzohmOa03PQvDFmwyEyz0YcTvz58BFtmE7iCmR7jReh0TbCIsj1LdY/Mz0ObBR0gbW0Ejy82bnaIWk8oUzlJoDM4OJMKklNfhQH9YCMHINzVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256568; c=relaxed/simple;
	bh=xA/wfYKsRa1xzjBEfvEgJmKrwA2BaFT91E7WZjD+/I4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ki660C6WwIKNenp6KNzOkI2FIsV7guHIR5n81db2JRSk0FqTWVx1FgCI36e/79SD4un6WDTE7MY1XroIcQc31OMFix+K9dR0831o6gMAqhdyw8KNAmj872NUz8t9c0GK2wIGL8S64+ShgifDnZTcTi0Ylo15S0fdgIDhjiOVoGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BwlBpzzc; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BwlBpzzc"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c70cff944so964648d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788256566; cv=none;
        d=google.com; s=arc-20260327;
        b=VdSEz3nGmVUYcSsjjP6VCZLAIBLwCxGDqbCaFSbcdLS03xgPL+31z3l9K+Ojw4Phct
         6/Mf4/cpKfy+6MfG8c1K+JErcSfeRgqJ3dw1nGikXXRaFGJ/44nClELilVZPwWkxateg
         erDmcd7QGpXyp99rlI+J4pKP5PQOxVegdPAVqL7C1d+cb+DCM/EArBTsp15ktGsNOZaV
         0goaguRl+WNSk3lwtaLR4OjhLW/1G86r6z0uho/5N6Z4dgd4I8/JTC/3RmCHAtO1i5IO
         AYYIIELGEoPxSoSbZNPLkUK1uq8nuPiaIfbr7rGrXWMYUYdL0vlPIdGwSY3fAQmK0pgm
         iTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xA/wfYKsRa1xzjBEfvEgJmKrwA2BaFT91E7WZjD+/I4=;
        fh=sVL9GBg2tRuaTSYwFXwjmycDT0ItDZraYBy4ywZravM=;
        b=FcI3x5a1ZP+Rk6qVHLsaEvkEiCwdJr/ui2mCkv9MoHsfsk2vi4pKtq95tAYMrWJ1pl
         buU4/76V768GuXvtvlIH4CCOEMZx9T04t+ArxkEK4RbzSgsWArhxSRIuXrZqgwcSrHEN
         Y7uLuv0o8VTDTMim3idGF96hDXOPzMHyW8eLoxlwXW+VppqDylKJcPWHnLq+SgwOvm7n
         TQ3FTjFASQ3mgQBmELKkogz5NV9v7WImnwYSFseOIuWpCjfDTp4Fj4R2KOT0OFJDwdVM
         fV7ShdeKLzAb+A1MRCRD+p9piT02k+ctzz1Plt18OtepEyemYvZ4y/9VoMeaE2qX+xyX
         Sw2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788256566; x=1788861366; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xA/wfYKsRa1xzjBEfvEgJmKrwA2BaFT91E7WZjD+/I4=;
        b=BwlBpzzcEAZxEfOmU/20jzlIgfRQ66dfzeCLeXNqTjVUu7wWUwDuWYbrtFKF+fSfHU
         QvtS/2EWCHaFE0fVFtY6XvOp+rM1qZIFzAbaaRm2pNs0D64c8E6S2tpRads5ekUeexl6
         6r5MF0VvyEzAIy0+tZMvMaseE5C6Ug+merxkynhLL/IZQB0mMlFh9DZil3OgsUXRqKkS
         TvHak0w52Eo6cuUjnOYwhcFPW+Zqb3gBjdookgyFN/Uyow9fQsLdjyLp8WmifrqLqJiV
         XBQshag7hnRBDdqHzN9GqlIKbuYlodalpe9AUdvcLoWbFnvakwN8j5Jd2KiS1/w0TR53
         +AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256566; x=1788861366;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xA/wfYKsRa1xzjBEfvEgJmKrwA2BaFT91E7WZjD+/I4=;
        b=SCT7ZBnOjPBbYfEwCpbRkW2WTQO2T3b2ypJfpyHO9R+AgDL0uw/JQjkRX8ojzkgujg
         vmmMPC+bGmg/Av/Ze6juFNNx6lKcBLX/kRH1cgHRsrOpHuDM0+CwJ8vajMvF4W6Om3OO
         lHKaU82pYYmBSsyP3YzC7b3Qabzn03UfMLW92ThX7i/tSisYlqf0qy2X77RGhEIs/4s2
         z8qDN8zMyRPJIeEGh/7jzMr75yImVafL/d8WnEsT8pvWbeqH8PP/WqqUnaXiFPjdilQf
         0FQ2sdb8UO8++upNOvMJ2aXTL80k8cZhxpKsMg7RZ680XhGipkdNeBwvuIPoA8yhL8pJ
         Hp3A==
X-Forwarded-Encrypted: i=1; AKwUvByZJo4r2aCbhrOdKrlyoRfnlmwOca+iRq0NPwTl7WTP5IFs7+R2OsQS+p869vByOTNgQq/02wTcFJyfNp4=@vger.kernel.org
X-Gm-Message-State: AFuF++nGHy8A90oJZD4HnTTxgqHRT4XyPD8qfe1/wqw3QvfOpeCBcxfU
	dl1rDd+cvZSoNs5/HHl36iHQemMJrmRYnuYEbuXRFzTAvkmiIHr3I7TM/t9nFEwGE+D+gD2VUZw
	ryDC5vQEgzWeCLiAuP96rQ6EozAd56yTj4nMeYjFqAg==
X-Gm-Gg: AYBFou3er5c+cGsMIvVN6FVhAGLvhIS1QH5a/nRcQg/oGP8BC6rdIkKLJkDYAOuEG82
	kXeDqJnIdJWeMfLB5PLi6FtaRf4Xj/L7Qyi/I5cqCtDs4pR4tz4UY0iFG6vc5/3MKFHYaEoJbX/
	FZUFK3G/gb1okcZYERAoJlZ0/TsXhmcNMXJCQS6rWQx8+KEVcR7Fw60Ah81AinBZa1nzNENpAzy
	bfBDx8xUso5WP5XDhwxVcOq+vcJDOKrT6XvHUjmMFYfHNh0jAlXc2xlVWiiTUzyJazntjDcRKhO
	HjUNnaRaI6ewfyCphY7dJk1sF7T7dmE2gt4qJIwtuFG5EdTaAhBQ/wpO2Fq+a+KIpt2o
X-Received: by 2002:a05:690e:1206:b0:66d:7f5:37cf with SMTP id
 956f58d0204a3-66e4c755e16mr8690675d50.32.1788256565703; Tue, 01 Sep 2026
 02:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824094512.2436628-1-hemanth.selam@gmail.com>
In-Reply-To: <20260824094512.2436628-1-hemanth.selam@gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 1 Sep 2026 17:55:51 +0800
X-Gm-Features: AcwNN1W2zp26Au4wUZxrRdhIs2mCY-JPtDHdCakR9MIKevemfj3T-NfrAOEcuZw
Message-ID: <CABymUCONb8y891EFW5p9v44ofRKvVKeGve9SKSfjuwjTpSAYmw@mail.gmail.com>
Subject: Re: [PATCH] ext4: skip extra isize expansion while unmounting
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: tytso@mit.edu, adilger.kernel@dilger.ca, jack@suse.cz, 
	libaokun@linux.alibaba.com, ojaswin@linux.ibm.com, ritesh.list@gmail.com, 
	yi.zhang@huawei.com, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+4b03894b6ec5753ddf24@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Jun Nie <jun.nie@linaro.org>

- Jun
