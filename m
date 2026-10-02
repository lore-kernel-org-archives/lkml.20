Received: from mta0.migadu.com (out-98.mta0.migadu.com [91.218.175.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E100F486621
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959874; cv=none; b=SbhAUhT2eZVSaooy/8QHc/U1FvgNhjXqItiMyGqkknuuxPtLRJV53AOPRtIqZMkCR1V288PahcdikiR7ozhb/nx86eKUcqNGJDPbUO7SObMjHG090YO6IhboDkiMWtsIrel33jB/SvusKi3xTmgXWHvruV7NpEenU8VzHAUrMx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959874; c=relaxed/simple;
	bh=/I3TgWx8/U/mtgoPen/cIWwNHyR0DG/ZCxNDvpcPV6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=S08mLVFfLgxNInfoIxJjuHTn3kqYnYWZY+5pNxlJgqDrQ1pX+0oS/9h+zprvxEhsUXY87HREZcohcHq8IVJF6c5raB5G1iC7gTuVWhM/uwZG6xjR6Wy8/zmSwVfz+0Fp7ZB0aMKuGpUmyyzjn1aukaNxRAQpME8/r9KQDpIPnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=D/XP62Ya; arc=none smtp.client-ip=91.218.175.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="D/XP62Ya"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/I3TgWx8/U/mtgoPen/cIWwNHyR0DG/ZCxNDvpcPV6s=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790959869; v=1; x=1791564669;
 b=D/XP62YaJxq+hgGbQEMqDPTI4cn24vWnoXQVdKUOJwwxR7seimVbdu+bq4Kjx3HUq0Q80OrP
 wGQxoV5ug1pk+LKrgJaAE5bXQvioIVGodD52fhPZlGvXmMJIhr1C4anjBKIL5aBg0wXR+BQRGIg
 ijUjy8az603mjKFHa8k9MrVNn6WU+LSiztYthDLih2laHSdnAvnZDRoh4ySI3M2zTw4o35bQmGP
 9p8Ov6sA3nCgdDbRxrgx2h9gVOddIxbi36JryP+6F6ZYd2F57nA01/klh0Zk5wozmoDTqj7Da9/
 gNNLFeM8+zxGX1Oh8WK0NetzyUKWCMPyCORDAccqU/I4A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3e530eae1dfef6a4;
	Fri, 02 Oct 2026 16:51:09 +0000
X-Mizu-Trace-ID: 3e530eae1dfef6a4
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 00:51:01 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, corbet@lwn.net, alexs@kernel.org,
	dzm91@hust.edu.cn, si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
Message-ID: <ar_g9Z14OhcrSvOI@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22fdd310dfb0946bbe58ed71308e58d936cbed53@intel.com>
 <c719c6756f345c6c39db483654578ef09de1948f@intel.com>

Hi,

On 2026-09-29 17:40:18 +0300, Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Tue, 29 Sep 2026, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:
> > Every zh_TW translation names the English document it mirrors in an
> > :Original: field, except these four.  Add one to each, in the plain path
> > form that automarkup turns into a link.
> 
> I'm wondering, are these :Original: fields useful anymore since the
> translations extension adds the button to switch between languages?
> 
> The pretty much hard-coded expectation is that the English version at
> path/to/foo.rst is the original, and its translations are at
> translations/xx_YY/path/to/foo.rst.
> 
> I.e. neither the HTML nor the RST benefit from it, and it's just
> repetition.

On 2026-10-01 17:00:23 +0300, Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Wed, 30 Sep 2026, 葉宸佑 <chenyou910331@gmail.com> wrote:
> > You are right, and I should have seen it -- the rest of this series is
> > built on that same expectation. checktransupdate.py also finds the
> > original purely from the path, which is why 1/4-3/4 move the files
> > rather than fix their :Original: fields. By the same token, at their old
> > paths the language switcher cannot pair them with their originals
> > either, which is a better argument for the moves than the one I gave.
> 
> Oh, by the way, I do think the series as a whole is worthwhile cleanup,
> and having the :Original: fields is the current practice. Removing them
> should be a separate change.

I am a newcomer and might lack contextual information, but I don't see
anything rely heavily on this field either? I only find that on March
this year, Jon did not expect that the script checktransupdate.py uses
this field to get the original file of each translation.

So is this a convention or is there some additional circumstance that
forces us to keep this field?

Hmm, btw, I noticed that the Japanese translations do not have this
field.

Thanks.
