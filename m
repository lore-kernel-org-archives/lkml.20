Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9271A262A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788016949; cv=none; b=AQrdFiLfFzN90OfYndGZcehDiFE3QC/ircggA3jh4To169n8kn9leb9meCSJhvRwjQsBZsgYrIioL2ADCv63JviyOyq/tLBq4GEDUwLIZR7wQ4I/ypmgSl72gJPIx4AAfLdWSkBJe4QsYdCS/huStZWZNV0L6QlP5RTObEBLuxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788016949; c=relaxed/simple;
	bh=NOgOZlUaM/P473Dt/4oHR5EYD3Awq+JCy67VWmWka1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4JlxwZFhyD+nCB1t7rrSek+rh/oboI8sQ+6/QQ0UiSfzPakSyjaDl9N5YWIZay46S1bOP9DAjMvl6n/R2ldBBc+TnnI5TDQtZup6lIPxuF0GKxeNybUbOfy7PhO+jr8gM0D0aA0/WNvvNMba5k2DSjz/C0rwUynFTG5qj6pfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZUtgcT+; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZUtgcT+"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so3106945a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788016947; x=1788621747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZLJvRZdayHOtyOM9Jv6yNvITLKiJ6K0DLdKhkNStuI=;
        b=VZUtgcT+jqU+247AHm2DW63aXUcC8GI7zjKSzIO+t6LeB/5kjjFqORfGVZKcf75ORP
         wP6r+JhHK8yUZMEavCPvoGmuBJfqkKbDOvMkZc3+VVAMgQdhj1bRpMUNM//Ur/f+E0Ek
         fybbXT4GxlICs/0d5PnhD4f/2mEARNWS1QQ3+89KuWUQhF4HfCVB8lbqPJlFDemJYUiU
         TeGiSmRHfv0HePym9GdnXGgZ77jnM97eJQTaFFEN0hKK9KuZo9HDRwxI0quelNIUNwb2
         0uXQB20W/wzt3q3Z3lCyg60uDdj6Nm5RHgZs1O05xB6DSWYIOL3TVjoKonB5z+lPQx78
         c1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788016947; x=1788621747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZLJvRZdayHOtyOM9Jv6yNvITLKiJ6K0DLdKhkNStuI=;
        b=JcyYOXk2ArPaEMXnYj6OWg6uoLKd1UQ7iFizbmEx119D1spX+fSSdpcgjJK72PNyWy
         s6v9+rsJpcKTINd1KmIsRhYiuFy36NNvjyC0L0mbRtRQb3l7I+NZTagrsidF76/lhdAB
         1L6CVk+oS6JvNRchISQDXjKxQp2/aCgvj6apYORn1saTR+BRt/VIr/5EbE7cLj68k+C+
         RIp8h39do7z/wzQeoMQF+0iXZu2RpDxNI2Qqr55wgpTxwugnc6gvrAjU8lNRRYk6zdK/
         ARd/u31ILnHTP7I3sExotaImJHa5huq7I2bA8I1d9n972DqkD4R30nA7OAoFqLTd/m1c
         78eQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+EjLFzYkP062pwmnBY64JYafaCMdSkvk2gMZdyY/2Z6YoWS1zK1L0QoaYZZnpmtGaR4WW+WjsUoxj43o=@vger.kernel.org
X-Gm-Message-State: AFuF++nnP0sU18GR11PtPAcwNf0Q0oZ01jvf6jczoBMgd2ZMzDK2L5Jb
	4mJET2RBrx77wyX/t/vaX9fmpqzWnaxbvPgXl4Pg1OkoiGU6s9gFEnqAx+kLC/+E
X-Gm-Gg: AYBFou0KLsRHaq+1xAjGce3KdQzIA8vyR+bAuw8PhoKPdxDZ6qmBTK9njIQcBD/uz0x
	2/qjnguzvCEFXLig9gBqR2u0qCMzOecFYGeYwdN31XMmk0d4+JILMAXZcfVlI+EQeXP3cXw/Ew+
	jC5XzGc2oSh4qwYRDlAIIx47e7h6DRnP19txkQ7Tke6iAwTLmvikaEiZVAHSwGuxdA8SDnjF3wa
	Apc3VDJ8eGh8d5cyWjg2Ahl+xkKaxfYuIlbI/zFfM8bPZnhFuyDUGqNhco3xMqgrdKZ6Bmxah2b
	UujZtjfmdw8uI6WZLzA4nDP42ytujBVU7QoQD5SwOY3RAYkJmiRaJ3rpG4Kbclr5p5ijK83pZcP
	fpRRaOQDxfvWVGrrhMrlmXJcdAHn7hLmsxac2yOT5i79wFIPd9bxslU+ZuY5yircWn9ARMy+G0x
	tORQnxtcW6goldwebN3pF1pg7bJhG46UMJyi2M4PTj391miPROJWy0f44UgBC0M9IBXWtAmtBYP
	iza
X-Received: by 2002:a17:90a:e708:b0:398:9bd4:d17 with SMTP id 98e67ed59e1d1-3989bd40d98mr11033731a91.22.1788016947352;
        Sat, 29 Aug 2026 08:22:27 -0700 (PDT)
Received: from localhost ([183.82.161.179])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-142e0d2e465sm23599024c88.4.2026.08.29.08.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:22:26 -0700 (PDT)
Date: Sat, 29 Aug 2026 20:52:24 +0530
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nikolayof23@gmail.com, lkp@intel.com
Subject: Re: [PATCH v4] staging: rtl8723bs: refactor traffic_stat access in
 collect_traffic_statistics
Message-ID: <apLzDlcfiu9NJUwc@Debian.myguest.virtualbox.org>
References: <20260803180549.20859-1-seedandsyntax@gmail.com>
 <20260807150940.5066-1-seedandsyntax@gmail.com>
 <2026082546-treble-delivery-49dc@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026082546-treble-delivery-49dc@gregkh>

On 26/08/25 05:43PM, Greg KH wrote:
> Where is the 1-3 version info?
> 
> And the "Closes:" isn't correct, 0-day was responding to previous errors
> you made in other versions of this series, not the original code.
> THere's nothing wrong with the original code that needs to be "Closed".
> 
> thanks,
> 
> greg k-h

I see, thanks for the feedback. I will prepare v5 with a complete
changelog covering v1 to v5, and I will remove the Reported-by and
Closes tags for the reasons stated: those errors were introduced from my own
earlier patch versions. I'll send v5 shortly.

Regards,
Mirza Ishan Beg 

