Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877980;
	b=Z223aQMCUwN+g6i5TJ2aiSH1tFQlIs8EGbu7w1iAYNRdKANJiVdkiMzCgcB6/I5mWrPs
	 H8eXluQhO1cuem6ufLYXrKlp3piFu2ZqA0XtYjnCkPcGmwPr76CATzPzu6URZ+7m5Aw8P
	 u0b8O/oGmQ85BElZI6OqW12zojHxQybULyh4DTEHhy0SpCT9q6iu/UaaiYGH9sQK8/qqB
	 48cn/aiv1PzZP3Tz8hLUH/PcoKrcZwf5d1YqRXerrwwl9ncZGD+Ga3POeXYNUAkgTFFOb
	 zUwm2etM3WoKlqk+E051PUTsP9PNyjbp1qdsFuDMHxfh+kvuxPcUK0xtPGV/9js00Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877980;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=C1hrqNfab2BUyeQ19amVpDlqCunra+cEiy/RJrNmaJA=;
	b=kTALgVi2cb6CbDw/XCwAdZGK12U4a6jwyiBnc5fDQsEUgTHu+RgtOnS0JnBGy3SHk+vO
	 ba6WzZxd2xjGyAke9798dUHtkyTOUoLKn+/gW16/oFNGtq8Kajt+7xLfLvcJE05hZP4QN
	 V/qEc/r1V/3kDt5844RZdhnw9G4HvAs1AjkRAsNn4oU9B62F3toOX5s49AKTtEohaxVf/
	 13otpUZYzqFKqU/Na7t6kSOjIIQOPiSOv7Nj5HS0v/MNwwO0i1tyLwhW2WdgSVmseoA0I
	 zgOS4SAmUoh7Edu47Fn/uYdiY0n5KDNXY6Vze+IyCM1wnqm450m1KcOkNPvMBmWcD4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kV7uWx02;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7E606A31B;
	Thu,  5 Nov 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kV7uWx02
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9825B1F000C1;
	Thu,  5 Nov 2026 11:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877979;
	bh=C1hrqNfab2BUyeQ19amVpDlqCunra+cEiy/RJrNmaJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kV7uWx027yJNBJV681LZoEv5Bq9G0Br+8GS0AUvEyFZR+1OLxWiSV8sXwwsRe5bLk
	 BIK9S4QaLJE5aN26WFS2dY8USE7ULwRmuKaMugMzZh7FH7w4VsnjeEzlO6r4whbAG2
	 4NwEbDt2/RNKcwWEwOwqwZ2Kv5CfWAyDj9uos1kGHiYeP+UJWMZfZxJsoa6RxxUJmz
	 oqlbi8S6NLYzfHEnaMFqhKkimoY6TmTdnF2QiBs0yx5zjd1EFOLmXvliOUWYaNyrIS
	 UVvLyV0mIvxqoEwFan24dInFGdHn6C542Wyx1zQoPnK4GWUAbNKpnZzE0WxVCzP6q/
	 OAYY5BHoU6byQ==
Date: Thu, 5 Nov 2026 12:26:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com, 
	shubhamsanjay.patil@amd.com, adrian.hunter@intel.com, manikanta.guntupalli@amd.com, 
	linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com, wsa+renesas@sang-engineering.com, 
	alok.a.tiwari@oracle.com, konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, 
	jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com, 
	aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: Re: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
Message-ID: <20261105-nonchalant-groovy-manticore-76d2a1@quoll>
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
 <d40f2212-754d-4788-a555-6a58c2479bed@oss.qualcomm.com>
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
Content-Disposition: inline
In-Reply-To: <d40f2212-754d-4788-a555-6a58c2479bed@oss.qualcomm.com>

On Wed, Nov 04, 2026 at 06:01:15PM +0530, Mukesh Savaliya wrote:
> Apologies for the additional email. I missed including the cover letter with
> this series.
> 
> Please ignore this series without the cover letter. I have resent the
> complete series with the cover letter included.
> 
> Sorry for the inconvenience.

You got here some Sashiko review, so that has to be addressed.


Best regards,
Krzysztof

