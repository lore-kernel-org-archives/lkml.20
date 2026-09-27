Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4543D0923
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790548459; cv=none; b=UoLD6z6oQLDdCEvhlmUnkB4oAY6HJJEm5ezpYBu3jquafgw4+urf3EnFkIvdJYx5S6pRqoBN9al/W9oBWTc86SNq3UxcwqslbxniIOc+RHPDvFTmsuOAL5eA9F2hgAYD942LH182GO/ajh+OeFY88RhvrXjl8nJSaeFBEcY0CW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790548459; c=relaxed/simple;
	bh=Hp4OOctJbRKzqb2yW8G43pvTRyOpExkzzFUV2ij+OHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fx4WkKY/uoPy/ToQ9GoYNgN8CeJ4SoG+GUENFRKbneKIXl0Bp3filflRt1iN1WrfZSfziqISSVPI8BsqsZezz5l9KSlpOZR8Nn2TXY4D8ACg0+DDXaAokBzKrE6myASQQ1Q87TmYoMWqB1AD2pF0sQ++TCogXSTmwI6mANQQIbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=OydWa3hs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RISz6qgc; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="OydWa3hs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RISz6qgc"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A70321400043;
	Sun, 27 Sep 2026 18:34:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 27 Sep 2026 18:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790548455; x=
	1790634855; bh=7vqGQuR76OwCIa8mKkUWKH7FtPv+N5MafcWqQpKlZPg=; b=O
	ydWa3hslXduvRVUFz+pw3j5VwxESFQ1Bgfvm022wNKAw2QhX6cg6lls15QVrVDm8
	JhW/UmYu2NPFkNSyYIImvsg8lOxRcU3TqSkpW2j9ULEuglnn8RWia4CDUKGhafvf
	3qc2kuYwo5UH/1lCdfy4BpgTn3PwPFHDfMM5VkouBZxzMML+VpH0Yea/YCv6kQJM
	r0VUDFU87al0iW4CJp/QE9m4TfznKVYP5AbajU7Uz9c5t/Cf40yhWtdWoCnW4lUl
	uBmDJtcmtORhk2vLgovVy2amjyBnLUpqdavx2uRwQAmMYlQEyT81XHQLeJ9iifn5
	QH8ifJDmDzGwDl1K2JVYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790548455; x=1790634855; bh=7vqGQuR76OwCIa8mKkUWKH7FtPv+N5MafcW
	qQpKlZPg=; b=RISz6qgc2rVGLkeVGi0p3SO9ROwm7SkaR0w37g+KaChgzmuu+vW
	OVpORpKh1fxxGp1whddlUuXLyBht15wd8Eiacu+KpPWr1tv14oOYrq7s3L4/E7ef
	UgY7LsovW/OnY/OLPOkWr0EdfBaROtUszHRm+tG69ANzlua/6jnUbPTPAW2gv/V7
	IE3zcvADwMrEpRSvh4uNhzPXugkYRLWNdz6TEiO6N4PTtrdYRiiuzWVEoRGSfW2V
	b8NhiTI+By7xdaqbuwJrEyJz6KSMWqhmxd158HWGVnjw3qkH+vu0eCcs1bL/4Md6
	TiFs29XVbGaxYY2V4+sqpXVXiTyyt8NMukA==
X-ME-Sender: <xms:55m5arhHSs882nEAHaI0NCKOidBqO7XhNTENZ19rlY-kRaM_HBIPzQ>
    <xme:55m5al8iitRPmzFUGOhVlxHgWbuGGDLVYq-IjHv--TYcbizndyftD4I9OyxOCKc-2
    dK9NsXkeAOdtnzScuI0nGYmPjYJhCI-r8QzjW-tapVcJFhOlAPNVyyMmQ>
X-ME-Received: <xmr:55m5aip6DJUch9SYWHdPjg7hMJANiX7R1TixQWiFcGiHoa7Ld8WOlFd1bif887-A7Nl7-cFp5KZJqHZBjknPOEdgmlU0>
X-ME-Proxy-Cause: dmFkZTGKh7IZxPV+tZPwUauaHd982UsCpuYxMe+1wYS8NA+ULPUwe2myfn9dYIVFlfLoha
    GfoS0uUI7P2tlgVylEt15lYml+3/xyiuwY7Hq4Re11QiaHKGuzPKyIUxjQuj83xNnZNz4p
    GjS1n9+BNnnE0EHttibHT9fu/wDVfcBYJvzb0raIN/4X64Mv1gxuX/QIp4mFuGjKXvLOnB
    inzP4kR7JVYavtR2rBrZANJsB2Fge9awg6FTepvasuWuX0cVMybH2j39clg2xQHx9iU2CA
    EEzTRp/qevaHJE8mB9Ug0tZHKPXt8xPWyDEbIczF9L1GVG0ahzDHcCrZ3zs/rJHHJA1YYu
    d7iKhfDLvHLJV3n2MDeHT/+wuI/s4shfubsDNH25iSnQLsefktK9AUFm58HVUexGETHyfn
    nido45cWEwPox7ttUlKiG9TStjHRiaaxbrmW2UvIs5pyHUzWJS6GAuM85wkJITqJy1vRib
    uvr3q1uatWWS2B1PaOEe/eFYFZIRa7TJ5nzC05NnkiG1yazxMAqHPwaEPU6JngR45iy0hb
    5fWxoV9v6PK51yv4rapi0cmvt10X9bnuL9aTBg5iFNu/aHjkh5m4eb3tels8mDL6kfYvwl
    8px0mnrWoLZvxigKdDp+28r17mnMxbWtAIMM0vzVzlOOSrnp9AjHQb5aMVgQ
X-ME-Proxy: <xmx:55m5ak-rYVQmAiVb0jsT4Sjv7zJwWzpFbv6fHk7X4B-G0sCObbwbQA>
    <xmx:55m5amWd5_f99X55O6-1cJqhrP0WrkG670XuGVG8OWSGqpW8Jw-Rng>
    <xmx:55m5aqC59AX9NfjUhz5gMcPwYXaqetuHtsZ-Q8C6n-2cMytZmLzlMw>
    <xmx:55m5anzR9nuts89b2zjQP5SSUCXlTdkALiHMLioGoT6J7FQSFvjxOw>
    <xmx:55m5ahW4saxtKlhED0ho9_xbXNWnG_g2Xw3b72ey9GcUZ0BFfxbW5SRy>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Sep 2026 18:34:14 -0400 (EDT)
Date: Mon, 28 Sep 2026 07:34:12 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] firewire: cdev: code refactoring
Message-ID: <20260927223412.GA90046@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927034343.28076-1-o-takashi@sakamocchi.jp>

On Sun, Sep 27, 2026 at 12:43:39PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> The cdev implementation includes some useless locking, goto, and waking
> up. This series arranges the implementation to remove them.
> 
> Takashi Sakamoto (4):
>   firewire: cdev: remove unnecessary client locking for fw_device
>     members
>   firewire: cdev: wake up client from queue_event() only when any event
>     is available
>   firewire: cdev: use xchg() to exchange pointer value
>   firewire: cdev: refactor event copying to remove goto statement
> 
>  drivers/firewire/core-cdev.c | 61 +++++++++++++++---------------------
>  1 file changed, 26 insertions(+), 35 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
