Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9467486B8C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262049; cv=pass; b=FSQqlQ6JaMvIShvwbzJMHecAQHFwgsSkRHdVboE4l1/+0kNkowwr/VcVF6YbBXrnBrw5MBFIJUWWN9jXAV5y87OroSgdRFEE7oKdNWQmmCFkIeXARCl1qrV1Ewhlwu+MopQXv15ERnQUOVtp+w7i4ESa+u+j0QN1N1PPfd60A/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262049; c=relaxed/simple;
	bh=iuUfA02SH2tSSicml2K0I3xqm9pZO7ThoY25b+dKE6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvNwy/EfOF85U8O/VeEu6otbvFDAGzLvmiWc8rvokR7lUTtJjBV35Z+gbGp1TdPMFGzBm3QXF31mFMG5VgP4ynr2z/sD4wNCkF4yDshXLZd3semGUuhJx2MgB2Ot+o7Msg5lJBTiMgJ9VpmjySmtPGqHogsKdqo9mb8RCKeIatY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WF48CgyE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVDl+InI; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WF48CgyE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVDl+InI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790262043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
	b=WF48CgyE55dtiKGZFTTd4Yx5uK+BVFW3hOpZHlI9D/q72DJQAVRzV/Cm7s5F8jWRVLHZvx
	/Ap7nhVtdZcJYP2ZjR2MyuCIMvbOu8T80OcagizcnHIXoYokifPQtMdRnw47OoOC7PW/I4
	0/Vr2GhBrk4PMRRpdHqaULN36KVRH14=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-30kTJAC6PsaTqmTOcK6pVw-1; Thu, 24 Sep 2026 11:00:41 -0400
X-MC-Unique: 30kTJAC6PsaTqmTOcK6pVw-1
X-Mimecast-MFC-AGG-ID: 30kTJAC6PsaTqmTOcK6pVw_1790262040
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-87014338e7aso20650277b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262040; cv=none;
        d=google.com; s=arc-20260327;
        b=GGEmTmpymmO5r0vCkZoprllox+tOA+Ti1kZWz0o7fu2RPsm/BzH+O8UgADrDu3br0V
         MBCPVuULnAg/SQ8RMNHVm9YyQMC+ucAzAlErKMd+z6Of0WAD4Rk6xvn1FtYykzJ7Bsfj
         W7ZE6m1gHNIgwVGqI6ACi+CI/ag4adj3y1Us+n46ymO/uMt9LgRCpg5tGkSS3hUXfS86
         DGKKG1CoR3XdhdWso8nMxdPUjhVFomHgDn9FiJN4O0qUUCj6wgvUR0drpN4pK/BNNaxb
         38xdsUueN+EcSQE5Zs/TBcv+GC2zR07Vc97fHHm5RBS0dhLxaxmbbmj2WC/OPFkdII5q
         eOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        fh=O7UDueJSILnX9Y7cduVb07RcBqdpp9UEY0BeuyIMBwk=;
        b=Eh8k6IsdkpGbN/Tpo+ziC0XL3gusqXDpwaSSbu+9AfIlDcZUzb1winRVJgkdyljXST
         zfr87tnKWUWjZJQBuforZuT7D3yv7ZY2tgyKsvK/fOCbz5M9XOJeqlflco8vb8PveKRk
         6zkGwYrjWi45JAXrLGHwERlyQit1mTNke23laM7a3g/Kwvy3z/mQ3E8oZgWQv/9iOhBA
         ysDlmh+LpeYkqDhCq16mLnu5ml2O0jSIXAiM5/3GiuF0YtfCpplrcERA9PuYeD0z+G7j
         hqymcpoi2elCvaFgR7m11FD9UKbsaw81fu1BNa+4rEkf3OaRxdIiERzqxI7K+CdZa+mv
         9X5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790262040; x=1790866840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=MVDl+InINlRiSWNoJ+zSo3dPDLpLFAx8rHOQcJPrFcrb0dFjn331QV2IRGTQ7mSLf2
         FzOGnMoq9jW909FTyZADgpBVLgDHXWeUVGIDkPw+aeVry1O2IqecYbQhdHv53moD09Gd
         M6/R10IHRh/oSqPNOZRSalRoelc2p/FUbgk8NWsvk10oj8K0P0i/+6Kb2SJNz7+VGtS3
         EHiUnog1bSJUloT5Ezfcd6Fbhr/4NApXO579lYUqr0j5S8iaQ1FgRSVlUokp15A2kalc
         H92GZLmjxY5Dvm/8H/oqzwnBKNx9aSsXGI80NbQvadYeVqffYhdBjfmMsucgQUH6nslq
         hc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262040; x=1790866840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=dLevV7gB35o180YSlTthgWallpyzEKVFkNpsEaaXYH9e9KXhdn3PdsxOQTJ957ZCX0
         mtPkMhRH+zuHPRlE6Pq6sp1nhPpVee1fhhxXCidVQrDVZw23vMRf+mXD5IJnO64vdeZS
         atjXD+KDmGXdoiDhU/kPQ+SUe8E/ObRXG6oXHVWwchilEvhWRDPeLhjv/5y9CLOYjlNQ
         EyHRiwhECiGWfuXlev9x7bgOq3Rgf0/gzQ55lKNAeY2ttcOPyIc3c3vORpaSsa8BmxM8
         iNAAG4JcouTbzTUlbacPDRPK62QXkCqK04Fc0bId2/dWuFBvz02wJBHqjsn6a+/MzvfU
         5KxA==
X-Forwarded-Encrypted: i=1; AKwUvBxlWHMv2wFA/fX+YvqDAGGNX1NfMD2h9S8ydqjWHdPstzAFrSsRTSURSt6zb+u+ocb4jmaMKQvwmyCnUi8=@vger.kernel.org
X-Gm-Message-State: AFuF++l9sa8pLANE5rUokpnSRNZW2sM29JpCT7GHI/icTVUhKYaIIcBd
	0ZU3L3f6HfhEPv4VnZ5cQ9KSE5JtgOkSBswHFdy1Ern3p9EHxkIB+BlWlEoNZPaFTPcveZnARHW
	q1yAiqlF6siy62jJIf8hB1xDn0wubQby7KEpS4+J+NIxc1hecZBEs6fGHpk7nmnaUE2leDilHRD
	nC6+Y8hT8r01x9LDS9O+6RXlkbJ4I5owV61pBmj2ai
X-Gm-Gg: AYBFou1iBEoCst6yEPlyxEMjegyPcIdjyLM4rsiqHfCAT21xvNqiOesC6DiGTBQp6nK
	33JqgDBHDSopkf9oKql7KZYbtrwei9/gL//ItsQXWUQ22PRMOx8Fjh0K5WY+vEH+aOWnUKarWlW
	Rx6sq5uPme+n+ypeEvkE/ML5XG2qbpchxo9HIZCN1NgtgnhgnIHuAUBA==
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id 00721157ae682-8a64e5d7328mr16132117b3.20.1790262039528;
        Thu, 24 Sep 2026 08:00:39 -0700 (PDT)
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id
 00721157ae682-8a64e5d7328mr16131377b3.20.1790262038827; Thu, 24 Sep 2026
 08:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <EKwbCgCnxbNX4p95qJ3xoytzeNBBLc2L_HOVWr-S-y8n7pNOIToj37TyoXRcLyIK1gjq_IvbreQ331gw6jIK9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-1-3573e2596c51@redhat.com> <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
In-Reply-To: <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:00:27 +0200
X-Gm-Features: AclHuK_S1nrFMWot6v8DC6klfULfaNk07isgmJtfP7BYAekyrR84kzWx2Uw9qhE
Message-ID: <CADSE00JhFYhDV2cuVxZwVTX6LTe8zH0-BR=-Fhv+6UXeFxq_Zw@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: qcom: scm: pass qcom_scm to internal helpers
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Brian Norris <briannorris@chromium.org>, 
	Govind Singh <govinds@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:00=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   int qcom_scm_pas_auth_and_reset(u32 pas_id)
> >   {
> > -     return __qcom_scm_pas_auth_and_reset(__scm->dev, pas_id);
> > +     struct qcom_scm *scm =3D __scm;
> > +
> > +     return __qcom_scm_pas_auth_and_reset(scm->dev, pas_id);
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>
> Why make this change at all though ?
>
> It takes a pointer to the file static _scm
>
> The reset of the patch looks straight-forward to me but this change
> caught my eye.

Yeah, this change isn't useful. I aimed to avoid passing __scm to
function calls but it does nothing in this patch, it'd be better to
change it directly in the next patch that changes the signature.

BR,
Albert

>
> ---
> bod
>

