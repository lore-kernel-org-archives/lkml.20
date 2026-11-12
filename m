Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475402;
	b=VQ4/smJGmxPt9hLNGCIQy01zSmilNmMuOaDvAChTLHzOJZpOSV/cnhF5gFlNVO9WTNR/
	 maHxEuGWmIlaatxtZzUgFMv0WkIG0bW4pFEI/bbK8KlLYHCeOhnscq75RfDqHhqV3iyK5
	 2Bqa/KI/YbDKGcko+c/GzP+l2pxXg+7wlPZgNoU57PBylzyWz732sMroXJGBFV5C/p5bb
	 AfgYX7Y33rhGcxv/oax2tugGd2J8sV3gUNFiDZIAa0eGh526tAznl4D8ka0mP6Q3rP5IR
	 mPPSerXwuyTw+08YsVawhDvzBym+wK668v/dn+21RdUAii+qMPakfTkIJjg1lVk4Rww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475402;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NJBNFkvT5YDjO964xhAcxtFAxCPD0zQTQPZj7o7dUOk=;
	b=tleMcZg5nSd4tEqR6izZVkfMUjBfnKsufu8A9UbHXRiRl973qBd8/cQh6KAHiua8oaJS
	 bYDieq2N76jtPyh8AIin3m12xzRdDflg0+2utyrOJ/6NRDnfiaauji/yc/o41fwzv3tcO
	 oGjbG/5u1lf1fGVGon7/5tTF6aB6QXq/xzixKNc6M1nEudT+uQtdZuGvWunm2sm7Yqmnd
	 VjEArRATwTs4W3Sd1zs8GFGYIUM43dGbQllJU5lXne7zzk0a+lY2CKoaC0B594Hkxol/J
	 cSoq58Q7xK64jepERC2RbKljS16eCT088/1TDd1BmC1mFivlNLpp684ou81m9H/IIZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcMzKmC7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4F718606A885;
	Thu, 12 Nov 2026 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcMzKmC7
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 834E11F00A05;
	Thu, 12 Nov 2026 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475402;
	bh=NJBNFkvT5YDjO964xhAcxtFAxCPD0zQTQPZj7o7dUOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TcMzKmC7Ha2n5FEQp2m5GVKhZxqlMHr+9W5n7t30ZjFyERsi6OhrD1HFjk79wOM5v
	 NeVVdPielhMtbNqRZW5cLYAs23xPGYFlke0qyoQqoK3qfjtfzcKThvOh8qh+lRL8Fp
	 EL0AvOVn13zDDeiUhEpkLxTfkF1aYlbXHIhr55vycDnguTd0VN1WUcsXJPtUkANi/y
	 GQy4pnAw4UBh3iZiIWfPXrvGNffueuTOikEp3WN/WKslv4Mm+nY5Y4GzJVzcmJBzW1
	 2qyX3aDmnfrDgvvakox55jFEf+9oANMwF+4zFNiTZ9WEETSL0n7XQdj+YlL4MUejnJ
	 eUolallksQccQ==
Date: Thu, 12 Nov 2026 10:23:18 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: nord: Add USB support
Message-ID: <qbokxcnuj26kvf6j6txxwqsplkfiqj2wiqnjaba3lropajgevn@icsafs4a5e45>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
 <avDL8IzfY1AcDjzY@zenbook>
 <o6t6le343ifmu5w33z55ik473xfynt6urv465xe3bn7hyhmncn@7atsac6o5bwo>
 <897d7742-fc16-466a-8a3d-985292431fb5@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <897d7742-fc16-466a-8a3d-985292431fb5@oss.qualcomm.com>

On Thu, Nov 12, 2026 at 10:16:53AM +0100, Konrad Dybcio wrote:
> On 11/12/26 10:15 AM, Bartosz Golaszewski wrote:
> > On Sun, Nov 08, 2026 at 01:23:18PM -0600, Bjorn Andersson wrote:
> >> On Tue, Oct 13, 2026 at 01:34:45PM +0200, Bartosz Golaszewski wrote:
> >>> Note: This is v7.4 material and depends on several patches that are
> >>> still not in linux-next. Sending it out to solicit reviews.
> 
> [...]
> 
> >>> Dependencies:
> >>> - PMIC DTS: https://lore.kernel.org/all/20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com/
> >>> - FUSB15201: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/
> >>> - USB PHY clock fix: https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/
> >>>
> >>
> >> Figured you resubmitted this because the external dependencies was
> >> settled. Apparently not, so I had to back this out again after applying
> >> it.
> >>
> >> Please resubmit once the dependencies are in linux-next.
> >>
> > 
> > The only thing left is the FUSB15201 series and it's only a run-time and
> > dtbs_check-time dependency. Can we proceed with this or do the repeater
> > bindings need to go first?
> 
> We could pick it like that, but Krzysztof would reject the arm-soc PR.
>

Ah, scratch that, there's also the PHY change[1] left.

Bart

[1] https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/
