Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D24CF49B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792272345; cv=none; b=C24DtmPcnLF4rexGALnT8UEyCag5V/PeehWFXuwc9Fp/rrWAXnPVUScFJjM5Axg90erf6bDwivmDjM9Q0NJR05lDHZ0eSIX6u0jSUekw4Wu67DtUbWDmpqKaNT+2cTA4UUDXknj2zI3nvyk6wk++IE868bjI1LzkZXNsbGTzqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792272345; c=relaxed/simple;
	bh=56ptqQlyHesFnGpk+PtWo4QmVljOTxhSInTCjUT+VZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s84wjJsfZ82DJO+o7Zi0RZrW25WBxONlpRIoW3kKSQatg6+y0wold76qYpF0s5bc4AvUuXyYVvceOpDvDx0UtTMBo7/zBRFr3u/X863q0aZ9ROH5K9AZeNHf1Db5SRZYvjYLOkHpEin7AMuvdIU+xhGCNR34WvHpp/5BFEnFflg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=p7crKOdr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="p7crKOdr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so6630945e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792272342; x=1792877142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPqZTZxjS+0hRnBnz4z6hzvbgGGkcWgYGELhxyf+/ns=;
        b=p7crKOdrfrQW6ssZzj8ZkZKQapgptWFXz0oaPRXvIJa3/B6OKvIZhvpcZreDq85uAo
         pa9/LXoNyc21AIk8ztXo9AYDC4ylIfJ0iv7N9gMfU3wxIOOYDykXujOMW6qyz2exXSj1
         y5KReDI+WaC4W7BuHcXG3kE4DFV661g+b0fQd5nmLahpKM7y+6u9TjOwWAiYjsTjIEPU
         b236jTRQ98tb2W0tJs7exosPt6Y7BN6lClX+eJFad3YQgBcB8LFlHKjiCYJYrIQsol0F
         ttsfxx46ib+vqt2vNGCF6Nh1dvKTlfJRkOSq87/z0mFJ27Jy8wZjrBo38EAV9yu4MOpZ
         nmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792272342; x=1792877142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPqZTZxjS+0hRnBnz4z6hzvbgGGkcWgYGELhxyf+/ns=;
        b=S/VtwlqH5KtYyHEKr4ye3njpBbe6vJW8ExFObPztNSe89QDYVSn6Qh5y3JhIxpQFtc
         aZjms/qY3CqjdSl9grzU43ZGNJgARyP+n3SCfaNhXXgRctPcpJwgkq8/Ww3mON8AqQJe
         +E1tfUfcN7nxt/yul3TH0uz2r5U7xnHSFvhd+SB2cSRtgBcQGro4LY1Qjz0S71LgvAqX
         u38W6ZdAvEOuVO+qhDINSVPa0ROny1U729l/O/WMJINZxwQpW+TkscIjKr2DgEInMszN
         QMD1KEqZ8rPyMO6tu7MRZBcJ1LDIhemE8uRtnjfPgmkbK9TzBPjM1PAnx6ofYTFkVE/n
         cnMw==
X-Forwarded-Encrypted: i=1; AKwUvBx2uFMDwO4G0tAmvC64k3AIIc57nq6NYVnLZ3Scmoxxy2g9OebfZgd3Kwxm+8oaxC18nXAbBFtkDS89HH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ59wk7bO/RNoKE5nMvaX2/etkQJSHY6xH6AgXF7U6DNwfknZq
	0tFEweCFdTKmY3QymC1WF3bzPMxU+9ev4JeEl78IE4AoVSnDsh05AII=
X-Gm-Gg: AYBFou3JRtKegAhnv7qf2Ig/hU8c5cf8Trov2bCpumfwxAn9HNuzk1Lj7zRSW7zo52i
	4j4KJDpZY3Hzaht+Nvql+XjdwRwAX+lQTcxi53hfucjetb9ehYXCBVByLvLKepUyBid+x5bF1Q5
	QIfANV1PiqRcpNF6N45Jb3DTAPe1O8BQ7GviYuxEkuvop9/mkM1NONldOj5gHgrvDhuDkwZIA22
	RER/sSj38TBFtrkxUk4p8LX0LhXa/SqL/JC22MMIDYhB7potZd294NrSksCIX6IXNr9a5Ip8Um7
	c3OPgL2MD0XowcVCIhC8lBHAOhEybu+rihGa3KsuWAx9P1vjlf8Mp8ic+xqUk9F5i3CKRDBHeuH
	Qvt5Zv6yEixNBnaMc/eor94wyVHgrioGlzAOnk6spnQRY8L9zqcQPQ0FHCO+cSbiGczd+rUueK0
	HCMsstQkTiTii3VLJcecvdJo/3ar8r9JYaESWZkNT0oG5VYwu2M7glJULtFbe6PZlk56kn/RMQt
	aNd6FOcGFj1C52AxtoPGBA6k4IDaapMsIk3eyseVKbk9OYJ+fGQ72k9uIk=
X-Received: by 2002:a05:600c:870b:b0:4a1:d487:2dc8 with SMTP id 5b1f17b1804b1-4a1d760518amr73953995e9.18.1792272342267;
        Sat, 17 Oct 2026 14:25:42 -0700 (PDT)
Received: from [192.168.1.3] (p5b057d26.dip0.t-ipconnect.de. [91.5.125.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm103050165e9.4.2026.10.17.14.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 14:25:41 -0700 (PDT)
Message-ID: <f91512f3-34dc-4dd0-bc7c-611b521f1217@googlemail.com>
Date: Sat, 17 Oct 2026 23:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 00/10] 7.2.12-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261017155059.698368299@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261017155059.698368299@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.10.2026 um 17:54 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.12 release.
> There are 10 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
