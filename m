Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070733F8BE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930792; cv=none; b=kD069H0jYcZCCzMI3zDE4OvYYpHqZ1GgxBoz+UJJDZejAQLrJU6wf5AuRJxu5I4OfnlEFlyAzmgUsENQMrD4ihmsOOoiPgK6UtSgWvOln/ZK+pOQMfera1f7UQVyy87UToNTHrsO9gDuzlWF7gTxIvI06ZOFu0aCrhELEXXqoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930792; c=relaxed/simple;
	bh=vtGNPSfQkdUbjvnoErBkpNP9TKcEfCrQsuxtwK4tYps=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C876aKmhBLg0Rci5WmvUR5k4saw3XdhS1zWjPOy8WKoqfObbK5DpgH+lEkmeD2udWQFUPAyoFzL8lZEJjhsUx9ur3tUtIKntYEaU6kf61km5s3x3ymOOa0jyFzxKf0HkK9i4AEZ1fYDJWMomcwGNH34U8wXH999JF6RBmYYJsNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSWG23XJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSWG23XJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB17A1F00893
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930787;
	bh=vtGNPSfQkdUbjvnoErBkpNP9TKcEfCrQsuxtwK4tYps=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VSWG23XJSaUOqUPev8A9KGVw/rfxiDsauGTV0emk1E/0+tj7K3AL1bopBkfQfwJeO
	 0Tirmk+xwVotaC0WDCUD6i5L+tr9JVprIJ6I1JOFxLG4t9yJNy0OJcuaDhKnIMyfIq
	 6vBwgXomxzhmRpbA8IRUsUXlRcdqtW13liQnMX1FJSapZdSte7sgm8SirzqMb2tkEz
	 QkWHQsdcf6twq+cST7SCxHHYHtPfTUqZC7J6Bsg2bNXXhW3iBzuYRgcRgWaxVz9OCL
	 14B6104JyjqLpNeS2XlhcEq5yClhhfEBRpA4ke50qsLTfgc371gJo9cICdt8pIhuzu
	 RxjkhEU1JnH5w==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3e27d525so2290371e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:46:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByS++tdqWzZaasSZ9P+X2v2k6YI2jst369FgrefyVNajflRJD6zQsUewkiHkzhA760V5AtOfbirFrd8R+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+SmlFCIcmPqzs/ZEG7NRqS5FkkIuMbNkvuNNKvyIdfwXO/4wP
	8CPGHJf2YLsAJBGUKVKGEPAkKdWXw3dPP2n4AAdYGMWMU2/Wqzw1ZpTEO1i8Smoxxe8OAjrluSa
	m3SrmCWh+JeY/KOS5craMISs0CWANaOnUWwFXRz0J4A==
X-Received: by 2002:a05:6512:8345:b0:5b8:f8f9:e080 with SMTP id
 2adb3069b0e04-5bb9bb272demr475106e87.26.1790930786596; Fri, 02 Oct 2026
 01:46:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 11:46:24 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 11:46:24 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:46:24 +0300
X-Gmail-Original-Message-ID: <CAMRc=Mf=_J3YH7BbZa=s70U5aLRYtxRVAYtCk0S+SGC8j=xXBg@mail.gmail.com>
X-Gm-Features: AclHuK9K-FX6o37hBA2uoBBNayL3nDFHUHaHQ6cOhXORvPt7CSVLxWWDeuS45ZA
Message-ID: <CAMRc=Mf=_J3YH7BbZa=s70U5aLRYtxRVAYtCk0S+SGC8j=xXBg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] firmware: qcom: scm: simplify code by using classes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sep 2026 14:07:41 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> There's a pattern of enabling the clocks and/or setting the bandwith
> limits before performing an SCM call and reverting the above after it's
> node. In all places it's done unconditionally and can be simplified by
> providing appropriate classes. There are also a few places where we can
> use __free() for tzmem pointers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Gentle ping, is there any issue to address with this? Sashiko found no problems
on v3. Can we queue this for v7.4?

Bart
