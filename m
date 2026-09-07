Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8148483BC0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782769; cv=pass; b=fdwAldm6VDkKSOec27YR3Lvl/H0ZcdOOFUfqiua+q1CudPLFceyDZTUZLEx4siXttyUYB6OUYUcFSWVQEb4O882EYuxqcUEON/ds+7t6mA/21s1JIBnIPl7P+u43aN0BLjiC9lNbUNXkAeY+XhwrnNk1Qev4qehy29CESQ54moE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782769; c=relaxed/simple;
	bh=HhprkWnzm5aZiGMD+GyLSsyNyk0pGLWTcDgmWY/eXjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZXLUjVvBy1ILzSZbFEVRrvVRf363elqQWEe+me1GIlpxMiTvK7+xIMZp3h0qjnhpgHfE51npQMzYpqLspQBf/TYL1DZMxo8WqPgjmXEAAxY6+LNxs0WsmzM4ZGt9E68z67wFmiWppC9lfBdpuQpRfmUatOnt9GkbidDiDuvO38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxNT5QpY; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxNT5QpY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-851cbd64814so1254659b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788782767; cv=none;
        d=google.com; s=arc-20260327;
        b=FcHcwHheZ82xxwqLH6fyAA07dYOveWgLmGSVNQ5GKyPBgznLPo8NvUrJB6o5wttE1X
         y2y1Ttee/EABjbrO+Fo+90OwOZpdD4negEyIifX+4hjmA+e9CDENrdWk2EO/ENpxly/J
         Rynh+BHsSwi3N3PVUUpUYDCpEj5JZxrDFN/JfkykDNiR5fVrqyMSQSC/7LFq7/lDDaTe
         WHj7rkdNrODNCBIQrzv1thgm5J2bbnfatjDFLQisjE4irE5wQJ5AlNo72+RkkFZ/hHQN
         zhy6Fb3PSix5X6iFWWZvpRjsIJDuYmkzy5Mh4yEx6dhE/Lt92w32DO/qMpqtbPQfpH8F
         mvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HhprkWnzm5aZiGMD+GyLSsyNyk0pGLWTcDgmWY/eXjY=;
        fh=s2wUUS5AZ+413mfq+PvuxgqcnczkYP/DO5Szsf5fBts=;
        b=UiwvDigfsMybrKY/1tzi+MUwijO/OlchDJxXsDhcQ7JcDkFqJsNmMnpvZ6alEudKBh
         z3vfsnEJGk9jBNWT15wQ/Zq2oKK/vZ5mk6ZuJmAqDJLTuwvXz5xA3XpZUFvO/wJMMONT
         +qdUN4GRqnfAm5y57v+iX69TxdXKJX6KeWql1aLU8vtqRMTwyhyD6eOOEbkQmQJXPHOK
         AQs3E6/OJ5bMzVGg9iIIvDu6nTEW6kJ4x3C6nTxrItgmgSvhNj4N+faSvowdM931G6So
         JwrYmEr4baB7aO/XZA/W5k/7u9Z7GvPiSuZ392T25s+qgqeohsvIq/ZXr0x3UKEU+0yw
         9VGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782767; x=1789387567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HhprkWnzm5aZiGMD+GyLSsyNyk0pGLWTcDgmWY/eXjY=;
        b=fxNT5QpYexlIL22aDz3shdSqdSZS8CWn+2qNZe26Aqij3+N3Jg9X8Un+Ah0MhJUI4r
         YePPyUHDxzoCgfycSH7FyGkT7X/VFK1bWLP2HO4k0CDGG4mHswDxmqbO6ips7h/0vKfj
         2KiH7/nNn0hm+5ZEf9vzDheBsSN6epTSTToeI3MJ1C+onSCWBnkbV9VFCYOH9U1vM3tu
         tF1iLs7pUR047s/9qzSbz1fZGU47T9x7G32MIxVSfy+DhATeNlElAAi1vOpP5zj0+0iS
         AVXcyIRVgpYaagmQlxk2taQrEZkvMg3+mLkqn934TcVLMlqDbYiOGo4hooq3ac9oHT8T
         P0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782767; x=1789387567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhprkWnzm5aZiGMD+GyLSsyNyk0pGLWTcDgmWY/eXjY=;
        b=F2kwtA5EtEb6nuvfmgWHmNgz/CIrnKFkYUS8uABSt/hu5OB+Gz0Iawi5vwsET3SO5Y
         GRI/nYv8oij0WH+UWgkLvEpwn0DJ9R6tDi1979WmVW0z6RJN3X08f+gSn53VyVUQQK90
         4B+aoDlC91v9tYPfQ+FXnvHaP0vMovgX5+U+KxD6wT8eu5lRhbq4318iCAhWmpE6/vxM
         BUz2uqYGLNmryaxbsBslGaNZEUEFMQpG3aPCFDfiKkBtECdNrkmX/ykB1KxSIpYIF//Y
         OV9WZ78vKiqtKdYyV4aBcWhGvzX3sNz6sxQyHicRJNw4CFKda2T7jyZSaqGbQbJHxsdH
         dUag==
X-Forwarded-Encrypted: i=1; AKwUvBzzh2pS9MmgShqyx6NHSVZ3/UOjf+BUk4wrXKs2Ukz3g6euTf+yRjNjXMVnQGKjgu3xR1+0N3aP5TDWgNU=@vger.kernel.org
X-Gm-Message-State: AFuF++kVPklOia/PggKOttjkYE315dmSUfCcv3WVL97K9lHQFweohjt8
	tFY/I4QTsSOAcovpUPSDWyFWQU3CmcTSHtkdR4kPeXiupe8awShrBMxtRXT26LBMl2HZjAGndaU
	s5jUuqA8rSkJZ68N7O15VwjxeUbITTpo=
X-Gm-Gg: AYBFou13sSNuWP9mhMZmuKeHiodLIV3DzgjfdAiVHBlkAAc8VwuSFchEhB9ghdf5MZA
	/VgQ/MSv+LRzxwNiDWB2OcOoISzQLKh/ZuuQm3cRzkYMpStD9EyJByHU6nxW+Au582rqdIvRWYY
	C5gvnDfCcZGZYN6Cey8Sggb+o4comYMMX6uq+XFTt+Sx5DU+QDo6l+8vcYIb/xQvSHBSXd/CBVe
	sOGHpt8ka29VNfX40q9ZTX37wG9JiIdbBywCw3R6EiD7ya7+ez1m6cxfLpZp3DN7Xj9/4+DvRzd
	kcD667659cz+ESR7PqbyHpcZFBrv+KvtEHTqi+vC/UOANEsta5iP9izyfog/vlL6DCxjh4xToQM
	3sJbn7JSvNtDkSu+IEyOHv/pdlkfcoIfrr3jVWIdu1mqNAEIPbyOqqr2J
X-Received: by 2002:a05:6a00:4c15:b0:848:46a0:3d74 with SMTP id
 d2e1a72fcca58-86169b6b588mr27969662b3a.9.1788782766620; Mon, 07 Sep 2026
 05:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907034502.12619-1-phucduc.bui@gmail.com> <GV2PR04MB11739E45D1562C9063E05D77788B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB11739E45D1562C9063E05D77788B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 7 Sep 2026 19:05:52 +0700
X-Gm-Features: AcwNN1VgFt55b8C2DAXKx-uTJk3d_l7pJsW4Kx0oozTChu1fJXNM2fyLx2t5bvA
Message-ID: <CAABR9nEHY+A3y52GmozKTQnot1RcCRZVV-Js5eyt7CQsb3JZjw@mail.gmail.com>
Subject: Re: [PATCH net v4] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, 
	"davem@davemloft.net" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wei,

Thanks for the review.

> This part is unrelated to PTP and inconsistent with the subject, it shoul=
d be
> added to a separate patch.
>

I=E2=80=99ll split this out into a separate patch and send it shortly.

Best regards,
Phuc
