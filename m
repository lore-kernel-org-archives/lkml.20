Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DAA3DA5B3;
	Wed, 26 Aug 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757622; cv=none; b=DCL/Y3txBu/lEHLS/ZtO4yNuzRROzzK4LyOBt8kbDxF9JBKmBWyJAB9V9VxafPHKKfeIWRECQobtOgZUiyV1KsK6LmHOQGBT2jWFWKgpf+Ehlzuds9FBub6iEZkUhlSZMKmn3ROs6OCyEOKCY2jRtavTbMUwGal30KDNRN8YL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757622; c=relaxed/simple;
	bh=sVIJw7cymgBj1ATpSjV8LFUPuXZkcFoVOJ8QhY4blp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWfQO2YS8YUfQUHByKhzUJs5RIv+oRSsRX21EVkKeYuvKf5Vjj5A0JcqCyOLTIwfp3RffrzSxmPYi0I42+hKmdL3s7s3PdBLU4DNZLkIpQgAGkWihyloK/LIA5EnA85L7DzzEhxTV3XtJmtg07lagsf6XsoL8xcv5WA5yaZUxZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lg74TGTz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lg74TGTz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45551F00A3A;
	Wed, 26 Aug 2026 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787757620;
	bh=Xw0DKvNafjxZaBXck2lnceoBgT0AUzt2O0tYvnc2+FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lg74TGTz9RteNSXxpMdwuMPUGEDt09hQbuSpOFIeAliQgvHoW0hgbh+e8bIO7MvNJ
	 MxnYHXfOmp9syfrFpe5MqiXJ7IO2G8f5HJnC/rm/9cZSamVp2ygN/EIDqO7oHkq9B3
	 DVcF1//LKxgmnKencGzfY35jfU6Q5tY4O6SV20mhWzvOxWDrumhjjr/d1UqbA8N4EB
	 q9+ayXTknc8FwrV5v6cz2BUryOlAyyedCV2hCEZFtjJTgdJlkw7jtcqP6Ac5GfKvj9
	 88ASbAN77s3cT0J5Qe6zQWsOZBN5m6x+bHkPm4srgTPzSciPJEH4eGHbSO/q3zpR/G
	 cYxh5ozHiifNw==
Date: Wed, 26 Aug 2026 10:20:19 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/10] dtc: dt-check-style: Improvements for false
 positives
Message-ID: <20260826152019.GA1769013-robh@kernel.org>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>

On Wed, Aug 26, 2026 at 01:15:52PM +0200, Krzysztof Kozlowski wrote:
> This might be a frequent posting, because Sashiko finds a lot of border
> cases.  It turns out parsing text is not that easy (surprise!).
> 
> Changes in v6:
> - Handle white-space differences in overlays '&{/} {' part
> - Bring back strip() from _strip_strings_and_comments() rework
> - Minor commit msg improvements
> - Link to v5: https://patch.msgid.link/20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com
> 
> Changes in v5:
> - Patch #3: Trailing whitespace or comments break multi-line property alignment validation
> - Patch #9: The regular expression `r'(\s\s+|\t){'` uses an unescaped `{`
>             The redundant whitespace checks do not validate continuation lines of multi-line properties
> - More tests for each of cases brought by Sashiko
> - Link to v4: https://patch.msgid.link/20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com
> 
> Changes in v4:
> - First two patches merged
> - Squashed previous #3 into next one (#4... but now it is patch #1),
>   because: detection of root is still needed for DTS/DTSO with code:
>   &soc {
> 	children ...
>   };
>   where comparing the c.parent.node_name to None or / would give false
>   results of being child of root node.
>   Fix regex pattern for "/{" case.
> - Fix comments from Sashiko (rebasing issue, help msg, align continued
>   values based on previous one ending with ',', do not report whitespace
>   issues for comments)
> - More test fixtures
> - New patches:
>   dtc: dt-check-style: Replace Test User email with Rob Herring
>   dtc: dt-check-style: Call _strip_strings_and_comments() only once
> - Link to v3: https://patch.msgid.link/20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com
> 
> Changes in v3:
> - Responded to Sashiko and implemented its comments
> - Properly handle root node with more than one space "/  {"
> - Add more unit tests for DTSO whether properties and nodes are properly
>   detected as top-level
> - Link to v2: https://patch.msgid.link/20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com
> 
> Changes in v2:
> - Trailing slash to maintainers path
> - New patches:
>    - Patch #9: dtc: dt-check-style: Add test for trailing white-space in DTS
>    - Patch #10: dtc: dt-check-style: Add warning for redundant white-spaces
> - Several fixes based on Sashiko's report (I responded to these on the
>   lists)
>    - _walk_bodies(): Fix setting up proper parent to each node after
>      exiting node parsing. This wasn't working correctly.
>    - check_child_name_order(): Properly sort top-level nodes by names,
>      even if it comes with unit address like memory@1000
>    - Add rest of property_bucket sorting for top-level properties,
>      even though no properties are expected there, except few vendor
>      ones
>    - check_continuation_alignment(): Improve error msg for
>      continuned-lines alignment warnings
> 
> - Link to v1: https://patch.msgid.link/20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com
> 
> Few improvements and proper handling of top-level node (name, not unit
> address sorting) and property (model before compatible) sorting.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (10):
>       dtc: dt-check-style: Handle sorting of top-level nodes and properties
>       dtc: dt-check-style: Drop stray backslash before quote for continuation-alignment
>       dtc: dt-check-style: Fix alignment of values in continued property lines
>       dtc: dt-check-style: Consistently call 'kind' as 'file_type'
>       dtc: dt-check-style: Introduce 'stricter' mode
>       dtc: dt-check-style: Replace Test User email with Rob Herring
>       dtc: dt-check-style: Call _strip_strings_and_comments() only once
>       dtc: dt-check-style: Add test for trailing white-space in DTS
>       dtc: dt-check-style: Add warning for redundant white-spaces
>       MAINTAINERS: dt-bindings: Include dt-check-style in DT binding entry

The remaining sashiko issues look unlikely to me, so I applied the 
series.

Rob

