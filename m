Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF9456287;
	Wed, 16 Sep 2026 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789590071; cv=none; b=Hyfd8SnxobOM59PehsBBeeKd7Q/cvGRhb8FX9D/eAud44uNBy8XFEnfmyfpo5cY3DJv/TdO/OsNJapdhPWYulNb1VZ3DgVDTOT7mbVtgc34KUUFChoq+utwIpgy6pQx+WnxccXX6gQUTzpilM9BUIdEUHFMjELE0bYvUZIYv954=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789590071; c=relaxed/simple;
	bh=+m0a54FZfvugrElKZTtAn5ayVVRuVQnKs26vNaDrX4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKD6TYuKDJEPALoEKN3GZ4iWr7eWsaB8J5XahPrVEsLVdloruOvk2aXQ0bKtdq2TxRbI9jLTSHj/wieJThTPzvxEwHtyag+t6dG9bm+/7hTkpTZ283F41smNtysDr2i4WgStSq9r6Xk/k7JdEBY8DI4VDXUKulI6b6hGgvx9CkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qg0W61qb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qg0W61qb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940141F000FF;
	Wed, 16 Sep 2026 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789590055;
	bh=SQeI/VDfR5tYFTqV051ErdqYf/V0bL/cD3Mwtz9zqsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qg0W61qbZZFZPoMvz7qNJ+kxUMT5wxe8iPh5q9o75QeaIT7VUiw5tOHVFJs42KxGL
	 nsFM1lj6muLqiVUoH4K4DcTassbEKsnkrgRQH1ynhIjiGSLAfM/ifcCsEM+EsCDaXT
	 Oxe9Oc3XVInlbDrwouwnnXyRuwsabH/n1ZgX79in/phKKoQPYWJfkKVZfWxhDaDvEx
	 ajWji40Z5KD4+Z7tq2zHIPoEt62yRGjJdAe/GYOmoAUWgsdIZlwqdiTNa/r5ce8IWd
	 8QPWgtLvvlPBzkLi2FFgizFjkAJWZApYKaZFuu63ixvG6qSJ9QUgDXnSGGtkUyGuiW
	 WhKKPcawl5dFw==
Date: Wed, 16 Sep 2026 15:20:53 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/7] dtc: dt-check-style: Improvements for handling
 continued lines
Message-ID: <20260916202053.GD1926857-robh@kernel.org>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>

On Tue, Sep 15, 2026 at 07:03:44PM +0200, Krzysztof Kozlowski wrote:
> Changes in v4:
> - Rebase - drop WIP patch used as a base by mistake.
> - Link to v3: https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com
> 
> Changes in v3:
> - New commit:
>   "dtc: dt-check-style: Relax property ordering rules (drop alphabetical)"
> - Improve commit msg of "Unduplicate checks in
>   check_mixed_indent_chars()" patch.
> - Link to v2: https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com
> 
> Changes in v2:
> 1. Four new commits 1-4
> 2. Drop last commit
> v1: https://lore.kernel.org/all/20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com/
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (7):
>       dtc: dt-check-style: Handle continued lines in check_hex_case()
>       dtc: dt-check-style: Handle continued lines in check_line_length()
>       dtc: dt-check-style: Handle continued lines in check_trailing_whitespace()
>       dtc: dt-check-style: Unduplicate checks in check_mixed_indent_chars()
>       dtc: dt-check-style: Right strip whitespaces, leftovers before comments
>       dtc: dt-check-style: Properly detect comments in multi-line properties
>       dtc: dt-check-style: Relax property ordering rules (drop alphabetical)

Applied, thanks!

Rob
