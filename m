Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CCE3B27C6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045550; cv=pass; b=bAxDCU7N0QP9uIrhyDo5pFJYT2fMXN0IS/pY+zZ2xdujGM4ImFliwfWESSMasN5mp38WDEnWdBdh+CdEMnmrLnln2kfa/PGsEl5ypGaXNDxn/wY+iNr7rliesubxSMb0BtWeGpkez3z17zndMt/jcS+G7sH3vFtUHHCV6aR5Fq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045550; c=relaxed/simple;
	bh=vZgcNyGoD2xypSKwXw/Ad5tVtETNlWG6kTClMXEsd4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdX8xODJ/9fkkkmrYrfiHMjcczgepaNXtshvGXrDWdqjkZiEMuzK2dbbiPSE0YSNHas+yGgJV9HlbeaHEnqjfT1FiHwCwLuEhzUKZECng7T+0s3VxJ4Dm/Wpb/0TUBfnruqgD0fah445MnZMh1tbyIXDYvNMV4wyrm7iaopjIJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfeXEc5U; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfeXEc5U"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8d882so4003989d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045548; cv=none;
        d=google.com; s=arc-20260327;
        b=qG7uSfvv6f2kZBcWUrmYkZTjI9oiaPXkAxNuhXHVa5gkfqHucDbELtW2ilNia1/cCQ
         hFS4zkha9e/vnxL7e4AiN0CUsYKzznjd4a/YRlIpWItw8lCJTlQC4Ljaopj/yDOEKJhh
         4GJV7Xh7ZTWh3yDjdKhV31WvJmF2qYxDdIEmdi9o4MlmL+SABVz/PoGPm6GrKavseQ8/
         zIgFzS0oMhLui1EvkD2V/3MBSXkmnSdH8OJ+rGC/GR92ugQN3YCk1rUlxxwb/KpvlCFO
         z72lDFiP0rx9qvyrStf0fvR1E9v4CLDPP7XzJz1YxBbnY/KTgis0GmzQ2Vs5dp1KFaYB
         Xc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ghvfyjQSQHrPZknarysRzqoTzq1YP3d2PY2Mg+SWx4E=;
        fh=VuM67+xJgo1jDBz+G8Xw+1uY2ofzKViBXz5sqMJKHa8=;
        b=Tm0ovZgpgspOP+VdbZ/dn531+6T9SACgXeIUci1SA+v0PTGhnXP0Z9vLF9vdWp+MJU
         olHsJRxzy5B3oCk+h5E43z7mk2Z8ttMtjAY3OQOwxLlo/qWlEUpfLw6AmXcBdbg/5gSJ
         wVIqVRXPuBdc/nsrq3E0Muzk1uyGO89gDXgL6v4KMoo6mP52ZnmsaI0nKeT15wk5ov22
         wWlDpr7J/418V++uHCifKfGGoKoxxPVODBCdytzi6HszlOC5/4Le8AIWD45c52lna/Zo
         22ZvyAgccEQWV6pHL0FBUQ9U66+yPIqeW18XzT3B3ksaXcOdgKP/3jtf9CZVWKa5AFMD
         UwOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045548; x=1790650348; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghvfyjQSQHrPZknarysRzqoTzq1YP3d2PY2Mg+SWx4E=;
        b=UfeXEc5UOrPqn+cOPfea66JiPCJSV0pIfXRJqG1p/DeqJW+6Yjr8Z29i4Ce4gX3YZa
         WRyb3O8R3jprr1nJXYMrQiK+RM0RNj7YVcKk6yU5no34XQ/rk/MFuqGQgFwTGt6M4VQM
         U7gDEqwAUUKFgUa3Vujp5trCzbSEfGpmGvWVGQDrQX+i3hXj0MFk9xqNIBBIZzAXHKMU
         lP9hFF1Up9lcRq4oTL2QWufe5XM1SK2tJHBntx7uNDQpF1eAnpuVC9uGQW5w0Gw95VYm
         1wPJhhq/OtrBHEsWwPVD/4bYA0RAxOBTLkFedhR5AtzARXk0JairK+PEOlO7KYT+hh/v
         dOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045548; x=1790650348;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ghvfyjQSQHrPZknarysRzqoTzq1YP3d2PY2Mg+SWx4E=;
        b=jWQse3/ump+LoQAvqDtpV5Kz1VFiABz/S541OGaxePqU9Usjk965fGfztmoVLZIx+N
         dOpgAVNQ8oRo9I1sIDHH8eQw5SMTUrWMqdIkYaNBVVie2NaARGcqJNw7vzMTN66CmMxr
         HSbknhRgS5833rHw47x82hhH/2RL0nJhqIKsRR2PWVLEEmW9Ctgxh62r5TvqKD0VCM21
         iSdjz1/S36LJIp4axH0B9v3AUM+6lVXA+ee2jo851sixR1R8mdekoiHiZrusYtDNsAUe
         Q7/EYbYH0nRDq7+qu4uC51GqokdqV1kbn1jUUNUHBbpGU+DFx1evmbOC6EHuab4DG7aN
         0yyg==
X-Forwarded-Encrypted: i=1; AKwUvBytOjMQAmUJQs4nKVwhehupuJ9DvO/i05fUUKM3hl1pmvCD12eRZwzSGidzV8XHBe81vN/JVNcuf4QJNCM=@vger.kernel.org
X-Gm-Message-State: AFuF++lnL3DE/bEkR/3rcyBT5TiVDK6kaWI3yNPHzW9VZbTWuVxCEi5/
	mr7F4b9lWBkZr1NuZ4z+gGU4Noi0OGUDM6GW8gIWK/uff9sYVcViWvQA3736UEBNY2hoyF3rdfO
	9RjnFciEakX7kwMcgsCnOH7ZdKDnb4pc=
X-Gm-Gg: AYBFou0ImkNXGQjRijaLtQ0ZFaMCU6pNrb7iuCWB7roFXprguHfhO30FVCOhYHTt5rv
	jZA2bp7hUOl3jQQA0gvomt3uT6FTRdmlynowBtk+RqL4/mHEmEWM6/pVjHRZR3N0HTaIjWA4rPs
	B8z5f0M6mPMQL+RxVHH5/7uy8URkoYLwrniFyw68wzUmHOkCnzAjIqIuUMnbfZLqO31KS0GKyJG
	seMhV7+ocbRkEKohss2WFtC2pbdVoT5bWEoQi8hR13eF9o4UBVI3pfEeMcGFtQiqfvQ4c5D6JGX
	5rZ5uWIYJ3xGb/O6kyRPiqacUYxv+oYC/7ae+75dFlov5ewY2XAudg50zg==
X-Received: by 2002:a05:690e:138b:b0:66f:c1bc:4034 with SMTP id
 956f58d0204a3-6717fe5cb92mr4558256d50.97.1790045548157; Mon, 21 Sep 2026
 19:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918041321.3532355-1-lgs201920130244@gmail.com> <arFJzYqY_mdeXr4C@quoll>
In-Reply-To: <arFJzYqY_mdeXr4C@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:52:15 +0800
X-Gm-Features: AcwNN1WF2Sc4tKp3txE3ezqyAtiFFXx1O5SoObsCwLYSaLQtB5TSAaZylyQ3I6U
Message-ID: <CANUHTR8c+kVfVWttETsVZtWSaBS6LAEGuipWYNUiHw7==LLfzQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: q6v5-wcss: remove all subdevices on unbind
To: krzk@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, stable@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Sivaprakash Murugesan <sivaprak@codeaurora.org>, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:14, <krzk@kernel.org> wrote:
>
>
> On Fri, 18 Sep 2026 12:13:21 +0800, Guangshuo Li wrote:
> > q6v5_wcss_probe() registers GLINK, PDM and SSR remoteproc subdevices,
> > and may also register a sysmon subdevice. The probe failure path
> > removes all of these subdevices, but q6v5_wcss_remove() only removes
> > the PDM subdevice.
> >
> > As a result, GLINK, SSR and sysmon resources and registrations can
> > remain after the WCSS driver is removed.
> >
> > Call rproc_del() before tearing down the Qualcomm-specific resources,
> > matching the teardown order used by the other Qualcomm Q6 remoteproc
> > drivers, and remove the GLINK, sysmon and SSR subdevices together with
> > the existing PDM cleanup.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication")
> > Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_wcss.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
