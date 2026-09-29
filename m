Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F339CD0D;
	Tue, 29 Sep 2026 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667566; cv=none; b=eJSqO/VCq3LgSB7ihAF+keR2b/NStCzOMfv9kqI0ZfSoJqZv+ADrtBdDWIykQ/5HPhgtwQsjtrlGH6GvrzKgdVs85Q0Y1JFFPOFIVtIfK8OWku9WwT1vhLL4oUGwbpwzze/5+adXTmIWW5qiFnoFv5Lt26yIrLL1PijwF/Zcues=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667566; c=relaxed/simple;
	bh=kHczxQIhar+3hTedxOPpdeuURuyFZHYgP2oSr202qIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lb4pkaehBoGzMhxbFNBHOpJRArGCwq/kljO0so5MQ/rsXcz+T0kHaq6yMWrrc3dZZCUKjNag8+BHBXQNHca9W1D4iPTk7uroyqaqL4r6UVKZr46iLtuvGcRRt8wfnrR2spMrD7t0y5rSVu+e4aPPgJyjgfOJ50qdPVbqNdbtX8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUzdntVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUzdntVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7251F000FF;
	Tue, 29 Sep 2026 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790667565;
	bh=kHczxQIhar+3hTedxOPpdeuURuyFZHYgP2oSr202qIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iUzdntVTNNaa7QriEIAQl0CTMAZghah28bwQeZqG+C6lKgkdL3AOeJjVcHSUcBgqf
	 XUryiy5cfEBzqUW05v1B+9a4/gy+SDqtqjHjlAoXPnS2E+uWmT1J/uYoL4JhU26v6m
	 QGeOVdqyI+m+TwOsuHYlFDfcMsVUGdxpk9LsAhgXLH91Fe45ll81tyUGzuYM/pQlr6
	 WLYG0vuSR69+VkiGYsK1uravZ/rM/Z7X6DizwCTsy6jJyzLZ3XPHYyoq3sGLWiaPzB
	 9PBcYeGjPT/MzC/SZYtf/PLfAYFl9Vmj9uktHX6w5efjopuC6mznbLdWju39s/1oen
	 KIlD7cloe/Fig==
Date: Tue, 29 Sep 2026 09:39:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Petr Vorel <petr.vorel@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: display: panel: s6e3ha8: Adjust to
 reflect the DDIC and panel used
Message-ID: <20260929-eager-heavy-ibex-2c959d@quoll>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-1-08d5c7bf72fc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-crosshatch-panel-v2-1-08d5c7bf72fc@ixit.cz>

On Thu, Sep 24, 2026 at 04:01:29PM +0200, David Heidelberg wrote:
> S6E3HA8 is the DDIC, while the panel used on the Samsung Galaxy S9 is
> the Samsung AMB577PX01. Introduce a compatible reflecting that, adjust
> the example, and deprecate the DDIC-only samsung,s6e3ha8 compatible.

You need to explain why. The difference in panel might completely not
matter if DDIC is always used with that panel. Why do we need more
precise compatible?

Best regards,
Krzysztof

