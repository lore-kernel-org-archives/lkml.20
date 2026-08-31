Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C724D35DA63;
	Mon, 31 Aug 2026 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199141; cv=none; b=AsG1a00ZEC00p7bOVb5UssWoGYNfhM1u0kvhUTM6/XqhLS9kIOm3g50bRhAmLeWk5MKXJIgQRXVVPj0s+9AXyuiXiwJtV0DtrQlb3t8HcZGOh0h6YmbHdKOAKUduceGcg/eD/Qph37azeFYK4vHXmnQxWLu/4B/kJW/vfVAlRSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199141; c=relaxed/simple;
	bh=s/PwckAAC4qRE5ElDfu0s5KN3bIF1WojPoXByGZHWMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdxSRb9ehV3XdkENeBGXZmD3wgGi6g9OHO0Or+GbZUpVTqiMU9JJDfKSQZpBOo5wOgyDvIFzrWciYOL6HbjKdxZU/KAe9V1XXvQpF28tuS0bfL2MBrrtq1lkMBWx7cHTi1yfTdJarCnXAXILivKQyUFsU9SF7yKHH/SwIfrnV/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTG4N32s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTG4N32s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293411F00A3D;
	Mon, 31 Aug 2026 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788199139;
	bh=5iWjveILn+e29tdoEaubwIZI1viwD4v+Fr6XxubPCCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MTG4N32sygMlWZEgFLvZgFxScGcxX6n7I7TTIFamZyLVD9JdCQn5WRsLmLHoC2pK1
	 Fdn3ErZ4n1yxxyGyiOx0blVZhgQ2SPs5HIHvoIuvmdwF1I268Y4dhCdg7c6hshIdxy
	 bzcBpN306U1DNwYq2Fgnx3aichjzk3xFQ4DAM8Yl04yz044FiQt4eMhzkmct6O1VgF
	 Wh0pDvEuE/mtoonp0qaK+R8TgBR0sFuXuHfMZ3MoZn0rCA+nN2TrYahbMAj1S0xjET
	 3jBmOj8QpoKj2AxLtHb1Fy+ArLXB4draSYUIV8UWOel98K/gWdWrvbipj1zne/+OPG
	 lH8+SaR/q4FLA==
Date: Mon, 31 Aug 2026 12:58:58 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dtc: dt-check-style: Add test for node and property
 name styles
Message-ID: <20260831175858.GA880726-robh@kernel.org>
References: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
 <20260829-dts-style-checker-sort-v1-4-6693a37d7ae1@oss.qualcomm.com>
 <20260830195909.GA151984-robh@kernel.org>
 <425f93a7-3574-4681-b5e6-9bef45ed39a2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <425f93a7-3574-4681-b5e6-9bef45ed39a2@kernel.org>

On Sun, Aug 30, 2026 at 10:57:23PM +0200, Krzysztof Kozlowski wrote:
> On 30/08/2026 21:59, Rob Herring wrote:
> > On Sat, Aug 29, 2026 at 09:53:20PM +0200, Krzysztof Kozlowski wrote:
> >> Common style violation is usage of underscores in node or property
> >> names, so add rules for following recommended names.  There is plenty of
> >> legacy approach, so add the rules only for 'strict' mode of checking.
> > 
> > We already have this in dtc, do we need it here too?
> 
> Not sure really. DTC has it in W=2, so initially I thought no one ever
> looks there, but duplicating maybe is not a good idea. I don't mind
> skipping this, next patches in this set should still apply cleanly.

Well, I guess this is a bit more exhaustive in what it allows. 

Series applied.

Rob
