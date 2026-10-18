Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C5B34CFC2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303995; cv=none; b=AVHHlzdmypeb5DoM5OuRfvWt4XeHd3vgelk1584uURgYBZn+UptOUAtpSa2ST/agNiM0vrV24R2vX7RRUa50+sPScwIZ08svmcxn2nWtSCowwhTfw8OYM6epj8IBXqyNVq3AuXGS6MJDt0sDqxRPYWyZQRPku4CswzGVB54iML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303995; c=relaxed/simple;
	bh=vnmtHZdDhZBGvwYO/xiOdpYmtwT2RnZuhXGsUW+JVvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+8rTrMUX9nBpSPXpbA1eLIbL6zG79A+9XtvgT5dZP9qLt9RHpmUMGUDFaWUynKxKyQ5mcIPR06tmN5V4tu9vIpW5UJvvZ79z9+4G8HXR5zJrjhNMOfr/sdI/zUykfPqiX+KFhuhCp0vMUuEYcewWzzzMIWgqNKPFRTgE57AGpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/cZlE06; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/cZlE06"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so2588081eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303993; x=1792908793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p0BOEICInirRlc3DFY+n9uEZ/XoIYazkQMk4BKM0uvY=;
        b=A/cZlE06yFSRDSGnwJykwHaXJ3wvOSifcelBJ5hA61DVhrb3TLcfGttaQMpbEDCAuw
         dJRc2q6o6N8mFcKbYdHbp9jfiKkBVPGcA9sR5sQz7rFOwkDFJehyEc+PA2lLpwlZutYc
         /rKtLB6Uh/yJiqXqoH4PXefOkzew7fwU5wamXKYKy8rPzm6jVjeBw/S8eFR1zEU5SV5s
         7imG+/cySN7Zr7Xk0qchaZLo8kmwyJv5j1uIJE1SQ9CYWl6vD58aKoLOTbrN10JOffo6
         u2TLcIJl+M2YmPUyigYFgqKLaPGQ4VjaBoT/KTsXiD41XzbB+uspgWEZ1AOPtrvhsiiA
         RS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303993; x=1792908793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0BOEICInirRlc3DFY+n9uEZ/XoIYazkQMk4BKM0uvY=;
        b=hIBx3wDxcQJL7AolnDhkOvmnWq7IvVSlnTUPbhDJvEeRI85g51OwBZzqjsW4VqvoHi
         MA5K0RkIpbSMrvTl2jYS2WnkE/pNIc6ujFBxE6+UHjjY2eMxfS9j24haZKFCvA/oMkWz
         DhMMirvzYaSMZCa7gdJSFWipAsqX1b977Nr8IUjOJVMAaJESxgsBYQ1VTecEoj5C3n5g
         Q+B6oNwxAe1HUg//IST1aW75hL4lzoUsn/EzBSvWCUDJn9aTAt1r4fbv3xbij9ue0nr7
         ifHx7h3bpe6c8nM9A+NSIjVdbiD4nFnttaDl/qVCOBNZl5LUhCyRZBkW8scO4y4E6vr8
         Fqiw==
X-Forwarded-Encrypted: i=1; AKwUvBy3eHFwa4/WkXqFEG1T2pFwgIuZvgnxgJUhQn/NENllZa41Hv+DDLWMmIYzV+Y33WlH5MJ65e2dhch640c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5sgOB6SGc7nqtDS9PuWa45YdgZE3n2Iiwsb6vsuuKi9pc5UOD
	+jsnxO3dOoDXruInI4J/eiHIcMouHnljVh7rhvLl+n6s7Eixj8Ytugky
X-Gm-Gg: AYBFou00dA4V+7zp/yCAR0lsL9y2AJiPe02nmyLJNbSqqVpejVwlxFdFhVXCO8X1SE3
	vGnpg71sBNwox3hfEouwnsqW+sDU6cYvl22kZ6uNAh0hv1dkH3RIkcR/ntsULHPaHcwtMCfgUdU
	ybST0c9rVwCYtkwlRZjM7dB+YrdqSaCecPTHfRSgTV05I9K3fCL4IE8V5+OvnJranExOKBh0CqQ
	7M+dZd2EEiMkLPSYKqx9i0ocGOh9ywKG3wsmDdZroHo3d46clSiVsl4bv4WxGVe2mpCChkckO/b
	oUJQl/gZXVRt950hqgWe1Od7YRii7kHHikG1cjg6/ySorcSnOdPFig2UZlWS+3+m5jYZRgLkZAx
	iYbxWAAgs3zDqPPoTqZsjgGWCyXnScunZHf7MDL3UwMeQey5kAiGXqVpxH2FVnYzVTJRBCA+H0/
	3NO/xrHRwFdH2fdhnplfzeW+Fu4y8CvjyiF4hkhMM8z1iot0SLXgdV41Uo4yCWn2wUMhSWq8Em7
	7QlPAWXQkD448G+TD/cAk2Ak836PFotU22sHus=
X-Received: by 2002:a05:693c:87c2:10b0:35b:20d6:8eae with SMTP id 5a478bee46e88-3619ea243ccmr6997406eec.3.1792303993423;
        Sat, 17 Oct 2026 23:13:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:297c:6f48:9e5:4e5b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cc23sm25179839eec.2.2026.10.17.23.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:13:12 -0700 (PDT)
Date: Sat, 17 Oct 2026 23:13:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Support Opensource <support.opensource@diasemi.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] Input: da9055_onkey - free the requested IRQ on removal
Message-ID: <atRjQCqkFbt6I3LQ@google.com>
References: <179229215687.3924264.8583597004889642167.da9055-onkey@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179229215687.3924264.8583597004889642167.da9055-onkey@gmail.com>

Hi Myeonghun,

On Sat, Oct 17, 2026 at 10:56:50PM -0400, Myeonghun Pak wrote:
> platform_get_irq_byname() returns the Linux IRQ number already
> translated by the MFD core. The probe path requests this IRQ directly,
> but remove passes it through regmap_irq_get_virq() again as a chip-local
> index.
> 
> This can access beyond the chip IRQ table or yield a different IRQ, so
> the requested ONKEY interrupt is not released. An interrupt after the
> work cancellation can then access the unregistered input device or queue
> work referencing the freed onkey state.
> 
> Remove the second translation so free_irq() stops the same producer that
> probe installed before the delayed work and input device are torn down.

I think it is better to convert the driver to devm as in the patch I
just sent out, it will take care of this issue as well as make the code
simpler.

Thanks.

-- 
Dmitry
