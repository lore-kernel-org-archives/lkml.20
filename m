Received: from mta0.migadu.com (out-148.mta0.migadu.com [91.218.175.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A96E4F798B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456500; cv=none; b=u9OEOOmVy23nItJ3iN7zWtN8xYret66LAhz8ONBELEoG9P18a7T/hQjiPFKskZBEkZhROVV/WVmf4a8uEgxFNHzMfYJGzvGXVg9TZYOdNf8VQrGDRFxm0sLfkD7firZ/qBeNt4eHg/sLLflFWNMlpyJlwEa96bWD8NfQPWZ9eVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456500; c=relaxed/simple;
	bh=JtW4XNewlQP0rGt/iIRbX7XZ+9XZjitvRrOIdxi5Kkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yl0KllJRb9Buu/N2QhkckT8/YG3bEfpFnnIFY4D1tKAtEgn1JQ0c2qy/7Sf/lVT5hujHQN0wXZRjlacGqbmaNsIsc2PsxAZOvHvyFJqqC5x5+Uk3aHim1Rel/UrrXesBrffFimSmRWHJVjMJgAdonp9xbYuLOdt7nXDbV5VCmZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=g2bp5M0o; arc=none smtp.client-ip=91.218.175.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="g2bp5M0o"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JtW4XNewlQP0rGt/iIRbX7XZ+9XZjitvRrOIdxi5Kkw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788456494; v=1; x=1789061294;
 b=g2bp5M0oQ0lA9rhhL1E14IzrFCo5ZSzbZiotDE9yXHnJR3tGXXn68HHbrxaZJY+LO2MrWri+
 vPPnH2xxTh0qnblovv4EPC40wLndf1lA5XagKU+1FZhEw0HO5n2nDq+/nUWOXYmhzjx4LmQImaz
 uYll14/Boi53Q3j4LB+W1+/g8Bl0hhWvvtNG4Mj/BMuYTDTyOZCj9cQTADPDnO0COSU8yUezNsW
 QyRmQFtuvHC6wFV7eUf5rRkMxTz92ZKaF3y0r/AaQAY3D0KWJ2o7mmoLZXZHWA8sY3smaaoKUIT
 2f1smkmF7mPs8MlritygWrikU1iFGbtlI1d8YOW6Hk/xw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 52b8783e6dd8479a;
	Thu, 03 Sep 2026 17:28:04 +0000
X-Mizu-Trace-ID: 52b8783e6dd8479a
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 01:26:26 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nguyen Duc Thinh <ducthinh100812@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone,
Message-ID: <apmtwqxrkg8pN0aL@wyuan.org>
References: <20260902084430.17248-1-ducthinh100812@gmail.com>
 <aploLWg-i315frp5@wyuan.org>
 <20260903125454.GA541154@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903125454.GA541154@killaraus.ideasonboard.com>

On Thu, Sep 03, 2026 at 03:54:54PM +0300, Laurent Pinchart wrote:
> > On Wed, Sep 02, 2026 at 03:43:58PM +0700, Nguyen Duc Thinh wrote:
> > > This patch series performs a thorough pass across several files 
> > > in the Linux kernel process documentation directory. The primary focus
> > > is to improve readability and maintain a professional tone throughout 
> > > the guides for a global developer audience.
> > > 
> > > Core changes include:
> > > - Expanding conversational contractions (e.g., "don't" to "do not").
> > 
> > Is this necessary? I'm not sure.
> 
> It seems a bit pointless to me. Contractions will creep back in as
> patches are merged. We would need e documentation editor in charge of
> ensuring a consistent style, and I think the documentation maintainers
> have far better things to do.

Agreed. I think contractions are fine as they are. (?) And I do not see
a need to expand them.

> > > - Rectifying minor punctuation oversights and grammatical typos.
> > > - Standardizing terminology formatting to elevate professional voice.

For these two points, it's a little bit painful to find other types of
modifications among numerous "which/that". ;-)

Thanks.
