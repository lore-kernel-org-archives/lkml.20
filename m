Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561A0355F5C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791102501; cv=pass; b=oEXW60r5ICdP24NN9p9YyEDKfjMICZ8AK5TMnT+tzY15K0o3N/beZQCRQ/EbXtfJrXgU1GSTR55SAtB9tM3J9+X6RJTrIYIqfRuhRjEJVvk6DxvFM2uDrHNVfzYTMIBQqc5RF4UHk1L+QisgLVy+/rjrOkx3WTZKNNr+VFnulzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791102501; c=relaxed/simple;
	bh=9lA8RcPd6wW2B50/8rX54EYklSeRBEjjSY9Wj5uA53g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYLCg7aNJtwfa9RO8O3cLmIE5lgN10FZdwt51R6pivQGwUlGFl15aZDwSCupYZuWLaneNuj7FbXnLlZR0XIeWnyyJirb+5TVmfeyIoru7KmDLZr2JWWazD8bZoMI2x6FPDu2PQBXpZXPloC7F9Q8hiQbywLihmOAU09mhPoQ5bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oew2WGxK; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oew2WGxK"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb657c504so698479e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 01:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791102498; cv=none;
        d=google.com; s=arc-20260327;
        b=VZEVKrNcrbB4QrlVvuqrCMnQPRLDL6W+UDlE3uLhFy+CQXJseMaOTPhnHQriddLYL5
         HcuYkc/ngpvrK5rpjQia5w6TfZ9Yi5jjLDcAlEou4pIolELqrlNFfFmvhsqlxO95r01O
         EmoYJr3le9Z/JecZcz150TEw9hStuW7xPmBx+UHhSBPg3Iiu4y+cqQBMM3AwYzcENnnj
         yaTQMlLABqOpfEhk0gWSd4VY9LRjl4c2l+aZfSoRclNY6i9RmZGRnvhEopzw1jxyVWZM
         RmPKAQpHbjS85HFQ72ocV+IyvqAHzL5fvpTtsQmbz2Bf8s+pE/W4MOhJs33a/8eZkaZn
         Ne2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2UfVrtQtDdLvg2QvC6NkvEB9QpKNZIi46PhakH6CwPs=;
        fh=hbwO3GgJHLub/8nsN3DxlQJr7DzjAMRuWbiUl5fhMtU=;
        b=jxjeaQrjcCe5XfSwerjKD9OjOArVvmbkYRDDc8bDyr/x8c9wjEEYYoVZVKiKuWbZrq
         eX2QWW3ezNYEKBWb6ARDTV1twQI2p+qif7tJwlrLmdqoRlPgABSba7G2+xF+K4avTnQ/
         h33nLySvHXAdMrZ/4BbUOchXFKCYeu+bbQ7A3Yi2HzssvaRtDWg45GK5KLkB27rZfZ5k
         4+Xuesb7c7AR6/gdVTaGh/nLpRQaJAxGJAFlgqQIdodMRBBeBS5veQceaoRKP+SR6xJZ
         mrYPKpVbEzNdhzO2yK1XnrxNmaTqSNKqN8Mh0ft2aF4rk/KZ3FupIk5H3eIs9pIgsxLa
         ibJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791102498; x=1791707298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2UfVrtQtDdLvg2QvC6NkvEB9QpKNZIi46PhakH6CwPs=;
        b=Oew2WGxKHUa0d4mfLOdZGpiPWRRcsBF174IuLM1LaXEzqoE4OSKtXOOQFESSBTPaQQ
         sRnZzhtaNgZl55RzCWjRuCU8ZJmzJa4vgnP2cxtgel+uCLtFQOlYBnpchzeK8qX/O59i
         Fl8p+aEeREyLOEFwiuECq5OPZoPzoJG8KkF+IzcgNI5BKrffmt3C2o6io0bN9rUrkBp1
         KqrbQ9TUBmtspdh55ZNyTbo7YnqkpyMJKD3GM4j4FJ2QWUsP4y/TiQJDLCJRb0Yu5Ck0
         Dc+uKlou/neYDt0LQQMiP5FNB5bx+02JMA2PAGqn5swJwAdWg6/6fuIIN+GME6vsp+v7
         07/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791102498; x=1791707298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UfVrtQtDdLvg2QvC6NkvEB9QpKNZIi46PhakH6CwPs=;
        b=xdiec/qFTmVXusaEp9hbI6sktwMCemc2vFG2pxvz8OSqca6GSJwbvrKWv79lI96grU
         dPe53O+nxRq0pWyJ9hlTJlLm6H7PJ7yufvHjfAzIeygi4VRHaL+PD8GQysbPHdUWEiPW
         IR4Vbzrba6fROYxoah7+c/iUYaWElqET1NF3zhWgqqz8j7TZa479ZaXU4nLsgoendYUZ
         G4UGeknMRp/YrIGYE94AYKtoNEVKKO/sXW5LtabA24cch4DxfiR+MDE8CFtahHZ9NOZv
         zWSCTB7AcXKLCYXZy+Vp14pdUqlCsCWnCU4udTIaDLBAYA6Vs4gF+SaOo4y/S50mzH3A
         YdbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzypVcJx67by1Tkf6alFUKGEdpcF15B169hOmFlcOkBN0nAhElqjMSO5WpS1d7mRtAiB61Rd9na1rQDk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD2i9hEkyN7NCOLL6nFIMeGfbY2a8f87+yro9prAWypwia++2B
	GOYggJbOylpZjudIOvECIRWyU4fVs+k3Hf4LPviCxK3l2Kd+Swez90zkrebCSBMAOV2s1CHIj0M
	NJYBs2oy2i7g5SkgDE9FuM/Xo4NcIdKY=
X-Gm-Gg: AYBFou2gDxvZvZtTCbkwW2GMWZkPmxSLTZFnea4zVbhD2B+ynnFV5t/F7EJXtccIiEz
	Dnq+mL7NbKpqj0eMorUWEa+KNmHVasEmcXffBgH8HdUGHL3AIKRGMKWziHZAAPtnG+qM3r0isVC
	BhuyNLcpSeUmN/nHsZP0ymzADvf5rQokEqj5YPIli8lQs9QfMuPn7F5GFKQzTkqMhYGy8S6+bfN
	TsoHhJrkYLDVZdC0+HoTW6VTTFEzur9KeQCVm67QxiAIR7bkFQGS7rhtJZYHnR7IMl+ZzA9btoB
	Ry207lo/w1ICmHMvDasqR+M2Xka0CdqydujPHQkiM0D8N/X9konacg==
X-Received: by 2002:a05:6512:3b24:b0:5b8:ed29:c716 with SMTP id
 2adb3069b0e04-5bcb54880f5mr1712748e87.54.1791102498104; Sun, 04 Oct 2026
 01:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004065930.1004953-1-maimon.sagi@gmail.com> <179109746015.1402591.14131579685594488279@kernel.org>
In-Reply-To: <179109746015.1402591.14131579685594488279@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Sun, 4 Oct 2026 11:27:51 +0300
X-Gm-Features: AclHuK94JJK7lpEO1Rvw-VTUrCkV0lBc8k2gs9LxPK6XjrE-JxVbKtZnZ_NtyW4
Message-ID: <CAMuE1bFcB73iDAogQQKrSmj9vUvfcV9x-HahvQDXiMxq_d_4rw@mail.gmail.com>
Subject: Re: [PATCH net v5] net: axienet: do not report TX completions as NAPI work
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	suraj.gupta2@amd.com, radhey.shyam.pandey@amd.com, michal.simek@amd.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	robert.hancock@calian.com, sean.anderson@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 10:04=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>

> - What hardware the change was tested on. For driver fixes please
>   mention the device (and if relevant firmware version) used for
>   testing, or say that the change was not tested on real hardware.

v5 has not been tested on real hardware; it is build-tested only.

Earlier versions of this fix were tested on the AXI Ethernet MAC (with
the built-in AXI DMA) of an ADVA TimeCard X2, a PCIe card, which is
where the "exceeding its budget" message quoted in the commit message
was seen.  v5 follows the pattern of commit a58cdf56b6eb in bcmgenet,
as suggested in the review of v4.

Sagi
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
