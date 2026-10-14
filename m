Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D5D549373
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988673; cv=none; b=RsIKfAWd+y2wOn3z1P4WybcURtKrmBiVybwjrkep7T6gUPoKJS2vw9rOOpZEtQM+vsE8kJDEjmrTTMvryUyEsjQ59fqYisDW6bEMzRJq9+toDNA0E55i+YlOVW2pY68IgoY5xh2w8CffOa1brhqji+pD1F6kQ3rm68sNl0gUt8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988673; c=relaxed/simple;
	bh=bM+m8AsoZP0n+YQ2Y5JkPzEnaeb8naZAYhSxv8IxcJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgCkOYoFn7o1u8hGBW8xkA14zQDUSrSs+6vYrw9LX1NJDUezhBRYHvvOmoXDEQ7//Xet8Owj3ynM0CPIFTyIgRCYElTcd23ryJA9QfRQtq4FWwdnN/1Mw22VW6EbEFOhte1Dd0qVFcY/c19Pa+ndH36FHoW2VMbN47WA/qJDSs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CYVUHctp; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CYVUHctp"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-919abb3335fso49900886d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791988670; x=1792593470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EifbxS2BmqrR7Rw54E5hQBhB3vAw2L87AL8h/7ZB1ZA=;
        b=CYVUHctpCQH7HZzsVKrhKZM1EdFrvKuiLpClCDTsYIu1IttkGrMvuOOmN04dF0E92K
         4kY3kd1IoXnhbd4lDVEuebplA7qqefzlgm0fh/sxPHV780nAnuUmkKQplgAedsAYQGIp
         LZFqZV8U5Se/cniox0Y4kwoTTS08y6gTAUZX3YMaUccfXPSRgJoT6oAOu++VF94c+6cW
         3ZZIIkFz57gZu+wyVKk8MVFN7MpTYzdvZDH46YYrBYhzFu7Pe/mDW+wlOc72qTqv5GDg
         LFu2BHaYqwJ2PRaTu3QczKWjh25pWZ424bK6rLpwhetrtPzsF+3Sf1qQsG4Cd0bcCelT
         Ya8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988670; x=1792593470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EifbxS2BmqrR7Rw54E5hQBhB3vAw2L87AL8h/7ZB1ZA=;
        b=X0CIK5KT3kurC92FRJMHOspHYy6xoS4N2Kau5CPr2wizWz6T917bvxx7e++t4Tez1M
         v1/xMc1PjomQgWliSh4J0TvJn5BDZ6vlVfhNaiN5+JXKGG7i1J+t89ABwcjmSJ8hlGch
         v/ot40+LjiMtFU9oE7LlC5VHm10EG0r1+YjIIfM3fXgON/yz3ZxzRGp0z9PKFgUZUrVP
         9H5vPzLoLntQmPW5FhxQEqJjFodQS5TY1sN7O3tYrEhtp54pJa8nPvxy/TTwshEqhUGb
         wm48naRXyztghe6gMuulr/FQKua1VtwkwN24Oa8v3CuWzWqKDhd9LYFRSPCWkS+lB63J
         I8VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeEZZQhFXkGmw5QPr3VMJHH8MPd0r4Bc9mqrbPw48PJqE5f2nGd5ov5+4YMYaflyuxWGYYiY8jN27Cp18=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/Z8/UcFqG0eVMH5z+AfVBKdU1I0FW0pRuD5LZ8Yl9c6agh0oK
	1qcwvYwNQC2ULR/z6B6yUosAWE77dmN40wXr+SRrE4hVZSD6aOgelwFFYSHSoW2qfw==
X-Gm-Gg: AYBFou3wuegIRtUvxWQfWY4RLUw6WKqlTyXYNmt5++d85931QEIqMkvVGToyWfAA0eQ
	0ifOMgvgL6TOgtyS1PpvCeqwfVOQ8MLPdZI9fIrwAZ9J3aVSYkaZBChorNzRikF4843THaztKk1
	Mo6hDaPepBUu3hW9giqpHomXN2Y08sHtwRbNjZxBH2g6AMl9iI1f1I52wXzn4Gwuwp+eqXF7l4t
	7uCxQbzOK2xstGlUo3zrPHx8j2oSggeBz//IIjhuVC5Tut5vSpw5cTRcOBaoZhj1amkGUSuOghl
	+IA4iavV+XHgDETzssUox4IhLLmeq1f7aY0XyyDxMFEqFSgEqWaPFmqJkIMz+31MzCE1nk4HwB7
	zaugihTV5PvrazAkdiN4elEZRBkGdId8plrNgXOSLe8AeRC/2Kj/MW4XoAKIWCIYEKURaYG/ECC
	6ml4rKZeZ+pVTdXZhGYeIwzdtAn0DjJfhExjZ+QTwjaPMb6/DbPQ8LXQQL1Te/YkgqHaJ3L2xaz
	5siQEaGNE9QTmlJIA==
X-Received: by 2002:ad4:5dca:0:b0:914:51b1:6161 with SMTP id 6a1803df08f44-91b555062demr273855076d6.30.1791988670507;
        Wed, 14 Oct 2026 07:37:50 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ba33991bbsm35640256d6.44.2026.10.14.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:37:49 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:37:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [usb-storage] Re: [BUG] usb-storage: 14cd:1212 returns incorrect
 data after large READ(10)
Message-ID: <b090f730-655b-4496-a955-c537fd7f544a@rowland.harvard.edu>
References: <34f2ac0a-04d0-41cf-a2a4-11a93c7c9b91@gmail.com>
 <1ff84ebd-f805-4f16-91cb-ccc805c8e946@rowland.harvard.edu>
 <b8c40900-c5f3-453f-a440-6ea540c684ff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8c40900-c5f3-453f-a440-6ea540c684ff@gmail.com>

On Wed, Oct 14, 2026 at 02:09:46PM +0800, Xuntao Chi wrote:
> On 10/13/26 10:18 PM, Alan Stern wrote:
> > 	echo 14cd:1212:m >/sys/module/usb_storage/parameters/quirks
> 
> Can confirm that fixes the problem.

Okay, good.  A patch to add a permanent unusual_devs entry would be 
welcome.

Alan Stern
