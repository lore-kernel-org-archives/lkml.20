Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CF7345CBF;
	Tue, 15 Sep 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482465; cv=none; b=R8dyaIFirmaDtV8tsGgbyAyDkzndkAU6jDCY1qDN2MqLCTeT7a7s4FbFA9p5lZarprXgNO5v6N9c0Ct8mOkWIo4xSQeYE9NulNTo5X7XsbQzywAwS8wd3iKUW4qAjhWmTNTls1u+icTyqs564OU2Lpi4Ggk7DmDTpEjbfBBc6gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482465; c=relaxed/simple;
	bh=cUtPjh0zldewIxNp9mhCQymnBNd/6pG9ZV4jNWg6FW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DA7HkiARX+tzaPSzuYVnm9SWZgVGeH7Zlv5PNeEwNF4zRT8tdiNCbH61okIP/BoliQhWG+fFzn0bwKmqIw0tkcmvNIinUE19A3d/I+JwOJ6sVZB9nU+4ms4ycR/ckpIbq0F+1VVblTVomG0ESRtjJkA9KZVzRFddo+MPTfSyWEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SG8RCldo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SG8RCldo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE321F000FF;
	Tue, 15 Sep 2026 14:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482464;
	bh=XeXrCF7kKHtOohfiibEbYIClpgW98Ub/K0LExgNJn5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SG8RCldowYERNVsQcORu4F/jbaCJPvGuy4+KvfldUJYvNI+EPVc8DCTKwT3TamTB1
	 bWyLYe2cwlqwyqDpkSxiDinMFp5DPrZvExRCTaXuX672o1XJBbm1aRuxaF/43CSrCk
	 fNNq7TVtZFd1oaQJ/ZOcfEY6kfRa1ah8x2I4McvXycU2XopABsH+Dznec7kaIrptqd
	 9XwsELKkqygxDbvf1RUrlhYkK3InOG/Pb3kme6e6SoE/uLOyBbiiZ9mJ88XAAdwAR3
	 k2JN3YATWJEeN2lHjk3tiJiCv/QHCGphifhPCPhNr5AqpsqddPKYRv+En46Ez/VBXG
	 dgpV23u6g8ZqQ==
Date: Tue, 15 Sep 2026 09:27:42 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] dtc: dt-check-style: Improvements for handling
 continued lines
Message-ID: <20260915142742.GA1926857-robh@kernel.org>
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>

On Wed, Sep 09, 2026 at 03:10:34PM +0200, Krzysztof Kozlowski wrote:
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

Patch 7 doesn't apply.

> base-commit: 694b801ceb1bea205878f2136e8b25c888e51be7

And I don't have this commit in my tree to resolve the conflicts.

Rob
