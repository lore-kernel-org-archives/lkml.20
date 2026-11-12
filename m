Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472945;
	b=0HOv0nSgvEGgkT1bnWvCCYs8cav2deXCojETq6pDGAMyttJsOy3GzRJSJo+FHtOE86dh
	 qh4WQkSq1SIjPkNMmBrCawpnTY/IZdINiaWMVWRoShzt6kDwSGb+kB5WGd8DlaQUCORWi
	 m28BhbRggYhIz/8Bt8/YUUCwtBNfh3oojInRMod9cjRe/nztIlSJ2FXkrXLPYYtWGFowp
	 IyPuziR73LaQ1Joq3TEGJazMTmP8WSs19E3YM7LTvbEoRifhIERh8Akmga99q6Pa45pgT
	 F+k4d1ElOxo5Pn5SueBj6r/qTlhUfRs/6Ofwrlubc7/Qw5n5Y96MXNjRvsSrK8ywEPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472945;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HyWSHHx1ypekksDhSqGRcHe+rqBksxrZ0hHOYq4hR8Q=;
	b=aSmzM4uDXKFl8ejfPK5AltIFClBzQ8f9OHerLOUodw/A9t4hdsH7FD6N4FdWqZm10eKa
	 2SDMXq6A7XX8ySjSWtKFRS4hV8VB8AVSsFDTSsBswJ5sck3d0qEldElpbno2twkWEWXnP
	 nzLu7qOoje/Suwcmb7o/Y+BNxEQNjKEsRDbpzzNrS5BSb/Eq5PSwGq0jPLnOsJkm3L/RX
	 Ab2s1qI/iG7cjxvUbXJ6AK19sx7DGtW/sUW2Z0Tw6TMSGeIjTsmZn75ML2/SU+rFAF9yU
	 vtZ/KnIFGpeD/Hg1AvUT3vQ2j+lfy0c1u4G8g3AjBBEQpagSZc50yQhG2UVWl04cWbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/WwOyIr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297B0606B580;
	Thu, 12 Nov 2026 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/WwOyIr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE1E1F00A05;
	Thu, 12 Nov 2026 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472944;
	bh=HyWSHHx1ypekksDhSqGRcHe+rqBksxrZ0hHOYq4hR8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I/WwOyIruZoMOkUbGZNU6q4KT0lvUgSB1p0xtgfgmttwEDqeTAtHNv/9hB2uu2Pki
	 Ct0JdXpop0O6/xJQVc4xLUrzytzxwr5hXLsd72kJvIvqhBGnxnyv3RkQ5jWbOMHO2x
	 sjQ6WhW+KLS5CKU3ObYd4049NdGP7DVLVBAo7APkV59B7WWAWU2cjY1M9E5YJ/3Doi
	 hF8f769e0iOZNKoVjkqrqNQkVz4U4wbnrDjzeg1p/ry0Ymtzy9sIDCytkJdd9tBVm9
	 yAA/+4gqk4Anq6KNVFrU5Rhvhuw5yt7O8eh2sL+NlZC/NDiprHgdbjEGObYTC8C6Zf
	 I8LrdD9/zjQrw==
Date: Thu, 12 Nov 2026 14:12:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
Message-ID: <avV77eoO96zacmoq@parshuram>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
 <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com>
 <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
 <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
 <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com>
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
In-Reply-To: <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com>

On 22-10-26, 10:32, Coia Prant wrote:
> Hi Vinod,
> 
> Gentle ping on this series.
> 
> The net-next parts (XPCS glue, dwmac-rk SGMII) are now in linux-next:
> https://git.kernel.org/netdev/net-next/c/5e91edfb0e45
> 
> The DTS changes are waiting on this PHY binding and driver to land before
> they can be sent. Is there anything you'd like changed, or is it just
> queued?

I dont see the dt patch acked..

-- 
~Vinod
