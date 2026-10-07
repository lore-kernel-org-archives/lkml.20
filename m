Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C673AA50A;
	Wed,  7 Oct 2026 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365777; cv=none; b=s3q9qlFtQ7YrpZ1GpSH9HG1Iw9B7btbhTLRym+KxVPRM2iqGrAW5rq27y2YKlArQobjxFvjj9Ai1iTjP7Z1kp4BR1M3BWb5WoQ7Aa0FjAtNRUi2NvrjNl09I3J1llz9lf9rralFIluvU/0gvklKMA1fHK6n7iyrM4WkJA6eQqj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365777; c=relaxed/simple;
	bh=4NGBoQERN3/+oWLSBwZd/IyCnjq8am331yzwlurbfI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3AvWeGjElTje0eFbtgRrhAuxV0i23xkugG808RYyhsBBeUt5N/71VQ3885sDx02B2GLHKipESOggaxesy+HeXCHxBDi19z4Gjtpt4aKPo2UPZyMe+LHwMmdWUahx8p+836U3B/GTEpKGDeKIryT7qiqknRqZAuzV3x0hMYP78I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXVQLQ0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXVQLQ0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4701F0089B;
	Wed,  7 Oct 2026 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365766;
	bh=lV/Aw3UeWCVBXAcKeMTdOtHCEx4mWPb6mQo1KjZTVu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cXVQLQ0e6EQUn4eXxvT+LyDiQCDKaJUe+JvjEmO5pZbaj9uyY0Gedv1iRws3YV1Z7
	 65SVR+v0mPd+d3IyLlqxXHk90peLGjORBDD/hvNVXViCq7ep7DLVd7qF8JFiXrSmuW
	 Bxx5p7WhZHzFsBaAJakoZK5bdP4zvEjsB4hFiFJ0iVNH7Y1RVukTV+LAKFQVxeTPnG
	 j46i4e1k5GJu+poERVx4UZ3bMY6n5GLWKrn7ZlZfUGByHq1X9Hn0vvbnvYaH5i2hvX
	 QBs/Xaj18Jzm8vtdiEArqXv8jT6msJVR7WzTK62oftZsU2PHsFWuKUHA5ougylBC4b
	 OLYtLjLrZuAgg==
Date: Wed, 7 Oct 2026 11:36:00 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Add off timing constraints
 for vreg_l8a
Message-ID: <finz2yjis56dh6ymk5vhqlndssxu52c3jt3ercvg5el2ynznkl@d3bsf5uo6jcl>
References: <20261001-regulator-off-on-delay-monaco-v1-1-db0fdd69c262@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001-regulator-off-on-delay-monaco-v1-1-db0fdd69c262@oss.qualcomm.com>

On Thu, Oct 01, 2026 at 06:37:53PM +0530, Jishnu Prakash wrote:
> UFS on the Monaco EVK can fail to initialize after probe deferral when
> vreg_l8a is re-enabled before the supply has fully stabilized. This is
> caused by the increased discharge and recharge time introduced by
> additional board-level capacitance in the shared power supply design.
> 
> Add the hardware-required off-on-delay and enable-ramp-delay for
> vreg_l8a to ensure proper power sequencing and reliable UFS
> initialization across re-probe scenarios.
> 
> Additionally, set qcom,regulator-off-debounce-delay-us so that quick
> disable/enable bounces across probe-defer retries don't power-cycle
> the rail in hardware at all, rather than needing to wait out the full
> off-on delay on every retry.
> 

This last sentence gives me the impression that we only need
'qcom,regulator-off-debounce-delay-us' and not the other two delays.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
