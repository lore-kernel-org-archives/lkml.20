Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7937368291
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789943346; cv=none; b=dPmDQh9iLlB73psFdGsj/257ILB3LnMRgDhgRpe5jsYkbxwHoN3Wu5B2L2h0OjOLQM6na3tY5ei0FnUE7E/WSTCodABOE9MtUEf6GToA3ZNx0hFrgXD6VBtXBZm8jBAi8UUVDZpy9OdN/Uk7koU1VNo8BC+8xbpOh/Qpk4sHXvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789943346; c=relaxed/simple;
	bh=T6+6UkLdUh4P50AL7Qt9EIu1Or29dfj9n3CGsn79zjo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=irPjsjnzSC1/GD3BFO2rQEl9j2FKguFqIac1aASLOZAjue2voCybtePDrQALyFREtuBsM+cE/jFpeKSlhFbSVM4KG/pYW7QEvNcOjt7zGVRqjG8YqK0BznGME/LWjJkS1jG3/uC6DIJ1adQZpVhy/8pvomyA2l/ZQGFIFRlVxIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPNLM7HY; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPNLM7HY"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso1966078a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789943341; x=1790548141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g+AxpEx+Wxn5rk/C0OJjKiwR2yvDIToFVKllW7bRQNI=;
        b=WPNLM7HYKWoW+kd2xM6a+FNvu9PUnM3JqQcws0Cp2X9t0a5itnNFmU8WQn2/Uh2cKS
         8RGxCzsmOzMwkXWxI8uJPL0l4xVWOF2HJyrYiCpZLEJfRx7G4XjAdOv4MHwCnu1DsK4I
         PbRQ03uP8yexiE3gldSMauEnqEXK/+HUmmTBRGrWQ2y7hT0JN0VsMCZO/Dzm1qgq0pcP
         /MVaAV2XZOJHChSUq6+98aG/nGOG3uUdKXaCjBbTEAMNU5+N1xIkKRqu6Yeqgx1MazNE
         zyoyhqljixvfOCMgoJ0VS8Ub4uZGrdN3ve5uVD1Ls6m9FkNzrG0El+oJrf0JTtMPClff
         8DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789943341; x=1790548141;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+AxpEx+Wxn5rk/C0OJjKiwR2yvDIToFVKllW7bRQNI=;
        b=0/6LLYKZu6EWoCoLALTl+FR9jpul7yRt7GmnTteDpG+r90lfDt/FGfPWTltbU5oTT4
         JEreb9ne+eEaz3s1ukwY3etKgBymtrd4LwWGbRWsE3aVooZJNSvza/7UMQl9PQfiRdWO
         pmID1m/OqJnOXkw6C/c1In9oSb6IoVT9WIToDXGY50BSPDNNTGsfTwuEL1h6R6ZWEoaX
         UsY6wKxCs7JeSMZw2dI9SOpXMZwKNMDqOvpw/jeoS4YCiohNFrcwynsARftmlCxWa8gO
         Z/niwDkzbDn5y+TVT7CKVaiQ5QTEafXE8W80NoHV9JLJTnQ2eYnceF0esfBr+XdorEv/
         qsBg==
X-Gm-Message-State: AFuF++nyUQgD+8hrXhberE6B4ix8cFqFNjhSRkFLXYCxCVCkY2ieYDn9
	4Bnicp8YRRzFjTjKJ6bsv5CcFlfZOaDV2+roi5b37Tj4j36EmuuIf76Y
X-Gm-Gg: AYBFou2H0nwU204Q89Ua1oE8pB7bdzr2fg2TLcQG+n2LyTVpV6PwEY9YeysJx2lwxk4
	6XjXjP/uaLmnPz1xIM/NVSxK+Xg4NKOrAdL5cJuW0G2gHgAgiuiRqcYKMG4Lcepce2Wo9LKUMiF
	b/E45+hBXVxQe8MBZBY2p1bESlmrxSCpfJe9/igmWU+CyS40/JN1arl/oevI4KRkTUe1eJfN1//
	qTzbTi5D6cAxbB1e/waaW2IiKV7eqCs4uxhy2fRup/9fcPs663JMnr+CbKhZDl/W4eL2QyEhyi0
	FmeQ4kT86yYPhRqkmrciSjh49GM5WefOGadK5EIiPnlFT4AzcTIbBWLis47kf9hGs/rgKOppt8N
	K1iQ1yMsrioAd27Vr7sryschRQhYb9zHGYD7aei6qwuSqc/G68GownMBLsuE0PXBck7UPU3fa+M
	pXUxyT/7ecdtp4weGbd/EoV+VdPfwZDYhS53HCScWgWUTIzeM4nMvHoP+bfl2B5JnobqqGsLSLc
	eA1GgEquCNxXAO5TMFKY2292Cxe7tLyd0Vm6eqkc/EL5TtkWhKP6Xwsbz8J1DbJqroi
X-Received: by 2002:a17:90b:314c:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39e54e78990mr14006626a91.19.1789943340978;
        Sun, 20 Sep 2026 15:29:00 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3318763bsm13162827eec.19.2026.09.20.15.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 15:29:00 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:29:00 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>, platform-driver-x86@vger.kernel.org
CC: linux-kernel@vger.kernel.org,
 =?ISO-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Eileen <eileen@one-netbook.com>
Subject: Re: [PATCH v1 2/2] platform/x86: oxpec: Add OneXPlayer 3 quirk
User-Agent: Thunderbird for Android
In-Reply-To: <20260920190438.3444923-2-lkml@antheas.dev>
References: <20260920190438.3444923-1-lkml@antheas.dev> <20260920190438.3444923-2-lkml@antheas.dev>
Message-ID: <5C44FB9F-0535-4A78-A47D-AEF20F33D8AA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 20, 2026 12:04:38 PM PDT, Antheas Kapenekakis <lkml@antheas=2E=
dev> wrote:
>The OneXPlayer 3 is a new Intel device by OneXPlayer=2E It uses the same
>registers as the G1 Intel edition=2E So, add a quirk for it=2E Battery
>bypass, capacity limits, fan curves, fan tachometer, and turbo button
>override were confirmed to work=2E
>
>Signed-off-by: Antheas Kapenekakis <lkml@antheas=2Edev>
>---
> drivers/platform/x86/oxpec=2Ec | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/platform/x86/oxpec=2Ec b/drivers/platform/x86/oxpec=
=2Ec
>index 38c272995437=2E=2Ec4c4babe8e30 100644
>--- a/drivers/platform/x86/oxpec=2Ec
>+++ b/drivers/platform/x86/oxpec=2Ec
>@@ -223,6 +223,13 @@ static const struct dmi_system_id dmi_table[] =3D {
> 		},
> 		=2Edriver_data =3D (void *)oxp_g1_i,
> 	},
>+	{
>+		=2Ematches =3D {
>+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 3"),
>+		},
>+		=2Edriver_data =3D (void *)oxp_g1_i,
>+	},
> 	{
> 		=2Ematches =3D {
> 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),

Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>

