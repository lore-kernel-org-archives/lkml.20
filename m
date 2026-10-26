Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018207;
	b=li3SEPXPKhvw+vSQh2qqSkqd7taUmxZ0kNj8NzvgOJXUDlsxcs9vQm/dh+SWmYHziFK/
	 Aq7n7aFAfEOEzQjdO3hIjmt4UOTJ6VImZ7Pg+1o1FO7MUkWTRpW/tFeiam3URbQ1nSigK
	 OVkphvMweTizT+bEXqVvx+hqibfOWti/+Fw3NkDSf4wYhLXg65uNnk4viQntBqRzI1CDb
	 dOA/4hvJb9OhRg9X561h4XXhHfAIWr0M11ooA7L3v+TH0A7AyUxPhC2Suy3D5DawEnMgl
	 Ur2S4ZchBxoaYXyN3uaW/lM1H5NGDI/KGTNBmVkW+i6xGIEL8xHEf2taC6x+PrIIViw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018207;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=HICHL9vZkQCWXFVCM7oneoRD1DunhAvGDTsJhni/qVE=;
	b=ysDovCPrZevBzspPziCiLQDp9p8lnQ4mGgPIqdyNWjVBAXP6phtaRQjkGrnec2VyvdM+
	 d1h+PKISPlxsnVF2jGcro9nhNr5pVb+HH3FGxxYMHDB7QCk7/1hwBC7rBGFOzBefasvSW
	 Q6RtSHVNHG0eoWv0Tw1ov7WZNg5VMAQvb1v6b1Fq5vN9dBZAkEhFi6qD7S1lQ5QMZI1vP
	 OYTcJuO1kVdPqQkTRUOb8Cu9IgVmqrtnaackh7jVJpiYo4ef34lKl42HyZu7x1WZpnQYu
	 2AQHZRldPnqJQ43+6KEwQ8n+4ruYyDxCzT3aJKKpxKdcPw8t/eZF0ejLFamKtZWjupg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxsw.ie;
	spf=pass smtp.mailfrom=nxsw.ie;
	dkim=pass header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=FRE4tG1L;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0648606A322;
	Mon, 26 Oct 2026 12:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0648606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=FRE4tG1L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1793018201; x=1793277401;
	bh=HICHL9vZkQCWXFVCM7oneoRD1DunhAvGDTsJhni/qVE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FRE4tG1LnrwPMi1Cs6EYtxZmcPtPXX2/SE4okIEdW9rVrzobdakT2R0CKf5fvUEO0
	 t+b2C6WctcLo25xN0blezizIBQ8tTHsebLDUTR22hRjDssJcZBzHNwJhxMYOpPeS5R
	 MzenK5/ceoCP91tpKPETj17/y2UldqApEelbaDn9f6umXCZrYU7EvrR2i/GhmFzXo0
	 04w6Hn9zZg1nVwENTV7ibIOUs9+HxT9EAmWz+AP1b+jJBGAKlijhjkQKgKEXouFtkT
	 j+XmIZjV1bu41kGShv/ZA//Q1IE9RgHQkYSP8IAzxU6fWsqsV4r7HGYgnJ3GB3WeuD
	 tAE1+HOiS5Y7A==
Date: Mon, 26 Oct 2026 12:36:36 +0000
To: Bryan O'Donoghue <bod@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
From: Bryan O'Donoghue <bod@nxsw.ie>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges" on a device node
Message-ID: <0b9fff7e-f284-4d46-a384-098bf90542aa@nxsw.ie>
In-Reply-To: <a0ed3cf6-a58d-4a74-939d-62c9e6643b79@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com> <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com> <99a419c3-81a8-4b37-b9c7-2dd56978162d@linaro.org> <a0ed3cf6-a58d-4a74-939d-62c9e6643b79@oss.qualcomm.com>
Feedback-ID: 54899767:user:proton
X-Pm-Message-ID: 068be5f842ec7b780e5c7dece63d821971e308a8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26/10/2026 12:31, Bryan O'Donoghue wrote:
> On 26/10/2026 12:08, Vikash Garodia wrote:
>>> https://github.com/devicetree-org/dt-schema/pull/207
>>>
>>> Perhaps splitting this into two patches as an iommu-series would be=20
>>> best.
>> Intention was to keep the patch to add iommu-ranges property as part of
>> iris driver patches to show the usage of this new property.
>>
>> I am fine either ways, whatever it takes for the maintainers of this
>> file to review.
>>
>> Regards,
>> Vikash
>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end =3D m=
aps + size / sizeof(__be32);
>>>> @@ -258,6 +367,9 @@ void of_iommu_get_resv_regions(struct device *dev,
>>>> struct list_head *list)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type =3D iommu_resv_region_get_t=
ype(dev, &phys, iova,
>>>> length);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (type !=3D IOMMU_RESV_DIRECT)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>>> +
>>> If you look in iommu_resv_region_get_type() you can emit
>>>
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(dev, "treati=
ng non-direct mapping [%pr] -> [%pap-=20
>>> %pap]
>>> as reservation\n", phys,
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &start, &end);
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return IOMMU_RESV_RES=
ERVED;
>>>
>>> on a mismatch - which is not what the code will do now. Mismatch will
>>> warn and then not map.
>>>
>>> So maybe dev_err() saying you won't map - in the new patch for reg.
>>> Either way this isn't a change specific to iommu-ranges.
>=20
> Sure the above needs to be addressed though because its not a straight=20
> change.
>=20
> Before if there was a mismatch it would sill be mapped - now we print a=
=20
> warning and _don't_ map.
>=20
> I'm not sure that's really what you meant to do here but if it is it=20
> should be stated in the git log and IMO it should be a follow on change=
=20
> _after_ the initial addition (or before it) stating why mismatched will=
=20
> no longer be mapped.
>=20
> Because add iommu-ranges !=3D don't map mismatched, basically.
>=20
> ---
> bod

sic - "before it was reserved, now we will print a warning stating=20
something we don't do and won't reserve it"

---
bod

