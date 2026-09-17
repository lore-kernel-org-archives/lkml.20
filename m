Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC894B53E5;
	Thu, 17 Sep 2026 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642429; cv=none; b=eq83ThdaNVj2XTPuOMGwsf4JUodvoYNrO4KP8sG3FcFKLpHjti93vIFj90OQ8OHDprf7m0GIs9FCCms84N/hTmSGMfVxE93zbSF92lw3DZQAmHYurohozSCRHTLY0Lf7C4fsiijRxqrPHd2yY1UhvMuc360nhZ+fDqh1//Tm3G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642429; c=relaxed/simple;
	bh=j9trsze0NtJaqcCdTjhp8onV1UGX0knGvGmsYai1b+U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeX1LB6tIGmmTpcoRsJnxoYVZDyZza2Ok5NvyR0AnKINk3E61ajWR2vXQzPf9X7WxZ7B0+tzVPBF1cw+P+Y7W8KDSOymTy8Ao/Aic5zlSANujFBoMqYfidmf/rWKeA6J4iOP9KTKwH3YKYZkGtCKzu6A+uewQOlGJCnmET3vN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=kazURudy; arc=none smtp.client-ip=79.135.106.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="kazURudy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1789642397; x=1789901597;
	bh=j9trsze0NtJaqcCdTjhp8onV1UGX0knGvGmsYai1b+U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kazURudyYvdAozFvY7pCeUpya74Hg62iysuU9FQ1eUIGwGtDbKIUAlvxUYeyP9KzI
	 cmOYz5fbDniD833cfVCowomhIm5C2W1uRBb9BXnPn/UEoacIC80gqI0oU5e5epC+xv
	 12meonxPhGOpw2UthC+0gyp20C+S20xJaHMYk8kSA/MCbwhHwhJ//IVav2jwJUXzUx
	 CQHMwal5+tdhBHJDYZ3t1sigKFPePeyDHRwuuY5txFeTivs5Vc/SdNjiA/NkvajaUd
	 ajRAi7F3gBSRcBNwsPGFseCTqdwtxYh6xGsB7Y2rFlOIU3RrWF3ponFsJpO6LpQZ1f
	 RXqF/wB/LgGvA==
Date: Thu, 17 Sep 2026 10:53:09 +0000
To: Richard Leitner <richard.leitner@linux.dev>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] media: i2c: ov9282: fix flash duration to/from microseconds conversion
Message-ID: <a9c1046f-8ce0-4968-a66a-e53af1e42013@nxsw.ie>
In-Reply-To: <20260914-ov9282-fixes-v1-3-f520af59df1b@linux.dev>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-3-f520af59df1b@linux.dev>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: e7326f476e346c4b716bb15ce8f6aacbc50642fe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 14/09/2026 20:21, Richard Leitner wrote:
> Fix the conversion by dropping the constant factor and using the
> previously introduced ov9282_line_time_ns() helper instead.
>=20
> Signed-off-by: Richard Leitner<richard.leitner@linux.dev>

Fixes:
Cc: stable@vger.kernel.org

---
bod

