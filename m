Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9021FBEA6;
	Wed,  2 Sep 2026 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357515; cv=none; b=HN9l2ZByD2GS4oxV+MJ6I2O8WeHaeV0roTtenAu804P6l3NnpN7X7I60wycYUOdjH1kGCG8sJ3oYssMt3nHKM1vHLdaUtMVCHcehiT39RckoaxluGhuWxVWcT+PPvu6o41qbX/winhKY12fFJ9UljRnjD1RobLFsvnDcl50+AKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357515; c=relaxed/simple;
	bh=peQBE9QB9LpnJoAlMRvy1Bn3mkWI2MoZB8WmoDySGbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvAnEemLo09yjnnQTotwx2EZg/SyqU/T0zBX845hiT84Sfqvnht+tyYuuCogJRkwwJm14HI0DG/dXPi+G0B68dvvxe95uwm/Ue/66pmaTjaFAE/WhDG1lSe3OuCzuEUPLYTLRTkObtlZFES7bxct8a1O/t2TLRaEw6vbi0olhEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbzmOCOg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbzmOCOg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571AB1F000E9;
	Wed,  2 Sep 2026 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788357514;
	bh=zebfgfEx2sWxKDAAqeM35LzzkO/Mo1voZLLWtrewGgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JbzmOCOgJIPXB6ApRQoZR68XDtdGIvzELgBdZnZPpCafDkQuZuXEVsEaGbLfgNARd
	 MDXVdvUTn22Fo4ubAeekiKq+9cguwThSyEl2ierhzHDp5+FtuinBqmK2yYWP4GHahZ
	 DQcakTTW53kbCCmyg7H9DNPxJvJaolX8nwtu1qt2rjgJWH2ftKPwKOEPtO9IWUdtLY
	 emA90v3ZB9wdTH4zvQ1yiAVJ1NM7hzJRZ9aZwQtwZiXDs3blehl+/Lj08n65rgRJI2
	 Zb4fd3NtE6nOEXwiyfsFNd1sKI26COBkMtRbHE8FQl/hbKxVvuIr59IgFN1kxneAVU
	 sfwGemp/LqDaQ==
Date: Wed, 2 Sep 2026 15:58:17 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: David Carlier <devnexen@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, qiang.yu@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Check clock-output-names count
 in the multi-PHY driver
Message-ID: <g25bkftt7l22pr4glysnt4ce75lubvbqjcgsnqzsabuurt5kkj@q2fjdyhnlext>
References: <20260825225729.230493-1-devnexen@gmail.com>
 <20260825225729.230493-2-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825225729.230493-2-devnexen@gmail.com>

On Tue, Aug 25, 2026 at 11:57:29PM +0100, David Carlier wrote:
> of_property_count_strings() returns a negative errno when the property
> is missing or malformed. The value was passed straight to
> devm_kcalloc(), whose overflow check rejected it, turning a device tree
> problem into a bogus -ENOMEM with no diagnostic.
> 
> Fixes: 1781be3c8a5d ("phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
