Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCAE449B26
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516029; cv=none; b=YbUeLFMcHpj7baBALMCACe/iAbLXl96h+Y2LSFSu/McU02pg2aUO1NqCby/LFmZ8SRNlACeDDPZ7S4AqDEkSIWYjK9duCdL8CALNx0nbt+AqAqFj1Bz0HxbTLt5GlofFXygFxoljKuzA7vYUpvoixFqgoJn7E24FxrybBHgLG5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516029; c=relaxed/simple;
	bh=gb/bhCaBcSofH3UK4c+zcu/cvaDEFuvz4M+trIwJIxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e12m4GNe390hxYBZPrI5PXSuLJwvQEZ+5qmY/VCN/HSGL0HbHySenXrfLL+99WqOsUWAEdlu87PBIoOtrsZq3p2d/Q3oN9PTd3ZO4m4IfLSrkWPMgBzlKgNdFDMYakf1u3DEjZafxfA/4ZsTGHcCQgKcexAsb7p9/SPV76N4cN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=U7GsvOyF; arc=none smtp.client-ip=95.215.58.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="U7GsvOyF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gb/bhCaBcSofH3UK4c+zcu/cvaDEFuvz4M+trIwJIxQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788516024; v=1; x=1789120824;
 b=U7GsvOyFjzxwtURQGgiuL5pi0opJQdIR/yvu655A7XXFeuaYDcqAwGUIjAwXT7L320G6QpPQ
 Nppl101lqVsQ3iRtGotUd6uCkbW195CN8JO2UkXsB6e0x5oilnYIe2l8ZoeEqdSfLvC5d3//G0B
 IsDekpHSQHTF+Zl9Yb3jdZo86SbTf4v9oLu/KUXJpX4eE2GueMnkqslEYc542zrP3hZOaiYvhfq
 gg/h/WMBb+x1+PBkcaY5GUMBGj4UDickkcb3Wud2lKnmTfulFDeIDBgsSzHS6dyz44v0LlbFpBz
 P4RURF6TtXF+0iwwztsn4szIXM9OJf5MJe1c/TDGw7iIw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 00a224914cde8bc3;
	Fri, 04 Sep 2026 10:00:04 +0000
X-Mizu-Trace-ID: 00a224914cde8bc3
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 17:59:59 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-doc@vger.kernel.org, "corbet@lwn.net" <corbet@lwn.net>,
	alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add usb/ohci translation
Message-ID: <apqWn2EoguCwX5po@wyuan.org>
References: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>

Hi,

On Sat, Aug 29, 2026 at 08:48:07PM +0200, Jiaming Ouyang wrote:
> From 395948212144549e20cfcdbd053817c4e068da35 Mon Sep 17 00:00:00 2001
> From: Jiaming Ouyang <jiamingouyang13@gmail.com>
> Date: Sat, 29 Aug 2026 20:35:37 +0200
> Subject: [PATCH] docs/zh_CN: add usb/ohci translation
> 
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>

'git am' complains:

error: git diff header lacks filename information when removing 1
leading pathname component.

So I guess probably you don't need to include these email headers in the
changelog/commit message?  I'm not sure, but you can take a look at
relevant docs for this.

Also, instead, please write some meaningful info in the commit message,
see:

  https://docs.kernel.org/translations/zh_CN/how-to.html#id13

Thanks.
