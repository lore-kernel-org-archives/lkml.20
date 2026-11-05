Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920556;
	b=s6Fr+9GJEra5F3A6AjlHXCQ4UvDdRwmffmpn7YX5e7tWiZ1CVfvtVcjGXXmiN4Rw7ObL
	 yM+mynWN9tB/MRDNLk/DqAOEoW30tQaSjfNevx4IgKuBDrjbyY48CdJjCmoBVd2WjdUCN
	 XswpMP5BHUf0kpDgXlLqoK3NlHpF2hUuYptKuUDwNwgnP28MyVCtQiZOUWhAm+k4mHOu4
	 +PrKXBMZTQLbNejoW6DvIOF656pHBvAGQlT3F9eZD8NQskAG4BAsCtwZgRrG3WwGIszZg
	 9NJIUcUnEuV0/Hl+4ruRDMIZlTEuvH8LVMWg0POdpt73L9AIxf/4MwbML0IvXILcAHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZIBbko/XwwoPcFK6nltO836d/lcp1X0dnZPX4hmz20s=;
	b=0DKrmRv4gphAwHLvB1u6oZ77+i80JAbUG1gESFFxrmK+TmLcoewNYDZbYF5MLRFc+56f
	 z8Qe+WpCaA2TCzMaWnE1wADpw+U7jSzzCgQFLYxMwHnfL3+qVLr0UO4s+G2n88vY6Clbx
	 65XJQdFXR28L0WQVIIjybTLSnb5uLgGH41w4cGINLMGTIxyJ24eT5sUF+P5dlCUwiBdXL
	 LbWWJqS5KgJ8kbJb7I20q0pEcN4BADBQzVbH0sXPZzAhV/oG91+mX1e3cwpU0wuP/34Gj
	 CPhoZE3lXRLx94uC4Y3uJrsncZkKO/H1oLfS53xxkFDhRUMii39gtgB3f4mGykMuQ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=UgrtqMxq;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCE6606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCE6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=UgrtqMxq
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f84a55cc06so82181a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793920554; x=1794525354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIBbko/XwwoPcFK6nltO836d/lcp1X0dnZPX4hmz20s=;
        b=UgrtqMxq4FYJbPsZrHYg84R8HHaHSKqcodpKFFXdRinWdZ31huS3uNWI57BfltmgX6
         xXWsmKNSsS1kFuevymyoBdDomfL6w8adDswsepy+rYMfmvZ0qo7KmOFc2z8lzKVWffPe
         Npjmt5BPGtqUcGNcOZsHx7I77vGa4HkCfSJzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920554; x=1794525354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIBbko/XwwoPcFK6nltO836d/lcp1X0dnZPX4hmz20s=;
        b=Cl45ke84SYMPiNfcbX82lNu7TaagkWnXXcRNWTpR01A6Jd6Wp7iVWngUvIRVMq54eG
         x1yKRRgAcwtX51Hg0whwLkRIL+/PDdx2a7FojaV9S0nnTNRk2wMYwpgU1LUUt1E/I3v+
         KYplVM5BY56LpMkD3OHHFw69tNqEF2UBBSIRAD6sd/GpZi63q5Tp/rIkLp+xi4C1Z4Ca
         VjjOFWaNIuRBs7I6+s8aMnWL1+PMdV+nKE7bMBn2UqkEgKnetKsy2/JRzTMVn8gFGbDb
         mQSCfgKHQXojOCyKiRojdsuDJ1V8HxYpFhFKjrmP6g/EUC3DwTWNY1bLWcN4pL+5Bs0c
         S/4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgLiEVrcAldy/TwUUTdaAwCDS3FX92jn04lsJUS2elSET3WerYLHryvYEbKOMYwDlh7Fc7GQlJ3jSj/90=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D19mbT4uetTP4Gvy5J1paLmXAPv0CSmGsci/F1oeumE83smF+
	9zL4M4J/Q0iPNBtAe0d3sqdE3YzlseSVGsawnKJnBjBCPh40iVMGGkoegljEGL/ZD5w=
X-Gm-Gg: AYBFou1gw8ukjtLjXEj+ez2+1owZJ9S2TlIxguz4WhDgy66+9DpN/Lqvy6O5Xl2lCJ2
	kYOAOXhL5/JXriNVZFfxpq202S/AAewbeo+Vet0dxJGeB6uMFsjjECNW6R/avOQg+/T/Q/fab65
	aJii4VmN6iB37YVFH5PCzn6Ow0uPx+Z529auHUwIvSotWcbuFOFG5kQ1tsONejVDwJ5HDAjoMMS
	UzDB3LuyjlFGfba3Cqa0xTSapyn0mwszfWK/WcJEwpQK8F9pS7Ts6L7GZ8f0tqZ9dCdFVNPCj9D
	fcc5RQmEyUejDFmeWpg93sDBXP3mez4VcEX8mGusI8y7KKxbBELN6G6HLD+CETQVdS4wnwpid6B
	nXOP2eRx24mRFlgF7uuNT3XcekzB7OW3Gk95LOEaXIIga9IYDfVU8Cns9Qlu2tQbxSj5KqIBDgp
	WT+M3p9fNHXbdqOHYan7l/k1JfDfDxoRpWj8YZAoE8NShESNe1Csbt5JH7oLis32ORsQ3afYOG9
	SFLf1wl8610kjC8bsP0OMbx7jFW+4qcKTKJNpMXxNmhxXsw8/LzPmvX/kRQIPAnpbbgrHuRAkzT
	/qjADCH5BXpKRYHBN8Wdqbk0h+3i9sliqSSjyF8=
X-Received: by 2002:a05:6830:4127:b0:822:b35a:a2c3 with SMTP id 46e09a7af769-85f1ce07346mr993561a34.3.1793920554194;
        Thu, 05 Nov 2026 15:15:54 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dd234edsm541102a34.16.2026.11.05.15.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:15:53 -0800 (PST)
Message-ID: <4c7e5229-04cc-4341-a495-0156dc3c39f5@linuxfoundation.org>
Date: Thu, 5 Nov 2026 16:15:51 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.3 000/547] 7.3.2-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261104211038.406938024@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261104211038.406938024@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 14:03, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.2 release.
> There are 547 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 06 Nov 2026 21:07:23 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.2-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
