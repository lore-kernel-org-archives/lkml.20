Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929A55A9874
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657748; cv=none; b=VoV78W0ac+x+AvzgP3ggSLnszcdf9BSmpxNNOCxrowzJvYTZIAtoqKdZkcucLP/I5L/O5uISiuAX5yayfd9L3Qcl3q6ldDDMiqceYv1A82krttrwqzWj8fEMec+JoD+508Xnjy/KkfySI/8783/2D9AL5VE37JGRyFIV47ZVnW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657748; c=relaxed/simple;
	bh=YyZeXPq0Ae8f8lUdWHQOs5TvNKT/kbLtCKws5UuFMkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoeU77+Irb4N4eNfHMiF4OIbb0dtk4m+vXk7Ip5aP2EgHDlQbZkeSoVaNjczs1uW+x6EqJRD06eb1JnwdSFlrC8//Sah3WLFu4RW0KNSCgLPvDjB6bR8UXQ7AahLamKFY2jf0+gnPWixCuB3DdEGGzDW9e2RDKwbeVVUM6GuRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BOX767Ip; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BOX767Ip"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93a2218d7c2so32089685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789657740; x=1790262540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FFzbULtBbWTbkARPGWfpXQTKad5t9+A3qD1Uocl7bNI=;
        b=BOX767IpBw1b291f1zdc5pfC8RklSI93B9CZjvFuOehgZBt4HbEuOhsEOrVYbRcigb
         UVGCG5+gn9L9HI5XVdRDtz0BWjLwGUtXT9XgqQCJc0ZhkH2h+h6qlxSBEUN+04Shtzcw
         j/q9F14OmKbYg00zix/VPk9gcHXu2WQHcF5AoXHyXWv6YhgaS41r3vj1ItSRx0W81bLp
         L03/iiIh+HMK1v+LBOTtclpS4uQj0nd4sSqdCm0QGHBA5iRK1DXcOxDyNPASw5CF4Rfo
         19BQ31LzNmpip9dZdTWADOMHLEnsmda0QmuMdE1Wa0ZZDM0QVFhUYEmnAs+2fMbailko
         2+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657740; x=1790262540;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFzbULtBbWTbkARPGWfpXQTKad5t9+A3qD1Uocl7bNI=;
        b=0Pe/p1c/nDFjFXNmS32SoygpTbVEu66IGABI77X1Rq2TRNOQm1SnyAoQQVhRi4L4Fx
         pI6r7hxvAmxzWmjGcfDB/rotJbymdNDx/zUHMvyTLp36aW1Pi/YV6R8PJhtWTfewsW6c
         elSSijkfWgL+V5UPnc+lZW+P2UIR9/XzWGjZTqv6rueLJfnAixXhTwFlxxLNKmf0XRZ8
         Y1Yxm1ahy0vnV9oVr6wMwLBbinvRspfBA10LPjE3Hb2zAlLnKYyymiNjbxusS+XJh0Th
         qPMuPhrHDi5MYBP/CRy4ca2HnTHH/5pRhwDWEF4AWvBRQkzVCoagkYeAMK48jMCG5tOb
         Nocg==
X-Forwarded-Encrypted: i=1; AKwUvByRSCU/Wu9q1fKHdr/9712UAB/BC+URXu410OeDR718X2jKVRAPqNShHE0dDUT+Sgu39SM8pXkGSXxGFqM=@vger.kernel.org
X-Gm-Message-State: AFuF++ny0/nPG3IPalF9lPGW6CPfUuB/gk+gYCeYuzi2Tya8VEDZDEgB
	Y5iUXFiKTPymYW2TASzGbeSIEAlALG1XB9/e7VU3N7TJi23r1DHNP7F28VBDmtaz+g==
X-Gm-Gg: AYBFou1YxKi9IMTXOAzJH9RyoIza+zAFgg6eqhgXowYRRn02TbYuAH4yWQYWEpsEott
	kpz04x1WgTnJT5QaNIyGfhLSZrGg61svxmeTNOdKX5gOlmls0EGs4PzpuX0YrgVAw8Y+HWCALF2
	JaGByXg71yWd1nJlSU/4/KxXKgf9JddvQn2hFvxqUdOA7bGk+jBN75S1kqwdmZ7t/FoA/HDzwAj
	NqsTyjeMKWEe1kAUqTZXzDJg6Kfxaji4lzlVphZ5Ukf4d9jsuQIggEmJf7fZicwvq7228HnINpp
	pwLdYJ7CY8xrFSo51fpWT5NUX167e/MrL+8qNkqhipKTal3K7BcfkxwAmEN3g/oXv6t/FevLwLw
	ABqK6mfHO7L3ofxiFuqTM9zlv+uqKWnqNa90xbpOvvSvzLNvBBRnncJ/pk0LWLyYcTdSSNyNz4n
	O2vBnumtKNDwikXwB8MOe3F/nbewQGPf0OSqTc5iyFqJVngRTHh/pzYREcnehjnbj8PCP5o300
X-Received: by 2002:a05:620a:2888:b0:936:cd75:8f91 with SMTP id af79cd13be357-93bc632c0ebmr562759185a.12.1789657737981;
        Thu, 17 Sep 2026 08:08:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781d94c0sm474614285a.10.2026.09.17.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:55 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:08:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: CJ <firefly0158@163.com>
Cc: gregkh@linuxfoundation.org, kees@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: dummy_hcd: general protection fault in set_link_state
 on unbind
Message-ID: <bfaf8216-d618-4062-b3f7-ae4da2fccd3b@rowland.harvard.edu>
References: <34667d49.9099.1a09f41e473.Coremail.firefly0158@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34667d49.9099.1a09f41e473.Coremail.firefly0158@163.com>

On Thu, Sep 17, 2026 at 04:00:00PM +0800, CJ wrote:
> 
> Hi,
> 
> 
> I am reporting a general protection fault in the dummy_hcd link-state handling,
> triggered by a syzkaller USB reproducer.  The issue is reproducible with HEAD
> commit cee9395acd8043be0644b25c34bfa86623f2b935 (v7.3-rc1, Linux 7.3.0-rc1).
> 
> 
> The reproducer connects a synthetic HID USB device through dummy_hcd and then
> unbinds the dummy_hcd.0 platform device by writing its name to the driver's
> unbind attribute.  The failure happens during the teardown that follows.

This patch:

https://lore.kernel.org/linux-usb/18ec3122-7566-49e5-9964-1028857405b1@mail.kernel.org/

was submitted at the end of July but it hasn't been merged yet.  Does it 
fix the problem?

Alan Stern
