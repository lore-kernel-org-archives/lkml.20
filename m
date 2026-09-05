Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD273264D1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788647812; cv=none; b=EDGBpINlsUmCVeid7OU7ResB4uge/d3tKT/gi1ppODdHTq7XE44iniBQrvkL9shW2mYzSXBS4qV22R+ppSwxCI2E7Zgc/3PIBY+t++YKreZFA0p2xyBeJhHk/6lG65c9KFFTXsP+Xm46tVj7IO9038MpouyoQX99gYkyiQLe0io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788647812; c=relaxed/simple;
	bh=47kDnBPsAVOPUrwjdBqcnGeJpYWqPauda86jUBJNxXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lgb3KcxM/7qCKYmACkG7tr+1md9JapckVN8f2DHAuxVTCqA7JDiGprj8+dc99x4cG8DUT2igw72/NGTSJsvNjyTCjURx32hSy2rqvev0g5C7OGFE9B+iI+HEV9oeA8owv1bo6R0JZ3QF7YnnjodeA5hC7JXpBUKI/LE5JV1DTtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so30804115e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788647810; x=1789252610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47kDnBPsAVOPUrwjdBqcnGeJpYWqPauda86jUBJNxXQ=;
        b=aR34DaOxzfRxgwusiGB5DauxdWIN/X7kuoHltlFKlYHGnpEoUwD8wQbxkjA7LMgzyj
         JAsRSnEqqB3CkgBQpIyxW8uoUbse0xum7gYcVk7qjnmgcYm32GT4NfGUmaKrBnj35Z45
         Lx5tXX8RItgk904ULzEvPFruw4+VMU/+O37KGhJ46eKveC1ugtSp3EqBwUS5k4o+Ibyy
         H/EUpWQD8XnNAiz5htyI4dlPE0MlBQeR1hqPnRfQeSnZEj2mbpkvtx9T55ukQbe8dN7w
         vARZRTPpwcxqt5iTSR69DHkFQUJ2/zwt5V7sDGXQv74aRLafGhfjrZu9FWPWg0WgG1nI
         mJ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwr4igZGgA/JPj+83sogTxkwJWnV/CYZibx3dVuAO3bMQkCDyZzvnTiks1lMXpwSA3TWuHA8Cr5ikwk9oQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mr94m/xxLMaWaoO0Ua5Ouui27YJYamoQn+KOy6c7Uef04EVvtA
	1QZwL5DOhSds2EotRWHmnT/mgOdn+OrdArD5y/qgEhFM97OjxlApDRpp
X-Gm-Gg: AYBFou29VByvSa44wBgINjRX4Sd6rDC4KIM3s1gvJ3CYZU2Ob3uc0sJmL1zaesIjh37
	Taq5atIa3TqgpHQpoMC/9cHxZ2w3f9C6SgSkh0Q8UsOdDjq8NPMEekssxOjGpgyJFFq6oj77b+T
	oASyAM3uN+rDPZ5+wXVJk99shSht0kkWaANU1px7bfY93FVnk2J5gHk1XaRNBjJs44HncAe5QZE
	h+2zDLeQqy/EVziwIn5JMBVyIhdU0vIAQ1xYtvVtNLLxmNhEIuQhJPvdU6g1iuaSthTnPc2CYgQ
	Qf2CbqOvJGS2kpQ4pSJ304sxSbgtYCFHjVU42UPGqsTXoRkPzdpQhhsZ/yJgLrt5vYXq6fO4uFo
	AOK4nUqZpHXKINd9u1zFo/+yQ7zgRjDz7FusmvX7OEXCnBMeqsZsfqHolKmRng5SxuKxygG4IPP
	D+8SCJp650Z4IpFxNMDk5KESNpnmgbqm/ZU/lSil0Fb8FMYXo8CdNCmaN3cFJ3gJMeswO1+nOL6
	wHqIshZjssaEbBlUyU+nTLYSq33pIQu
X-Received: by 2002:a05:6000:4a0a:b0:485:8a46:704d with SMTP id ffacd0b85a97d-4858a46713emr13097166f8f.31.1788647809722;
        Sat, 05 Sep 2026 15:36:49 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm16289835f8f.23.2026.09.05.15.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 15:36:49 -0700 (PDT)
Message-ID: <6b8ff0b7-c606-471d-b3be-12df3dac350b@grimberg.me>
Date: Sun, 6 Sep 2026 01:36:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] nvme-multipath: add fail_io_now sysfs attribute to fail
 queued I/O
To: Krishna Iyer <kiyer@crusoe.ai>, kbusch@kernel.org, axboe@kernel.dk,
 hch@lst.de
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 sj@kernel.org, saravanand@crusoe.ai
References: <20260904032605.65758-1-kiyer@crusoe.ai>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260904032605.65758-1-kiyer@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/09/2026 6:26, Krishna Iyer wrote:
> When all paths to a multipath namespace are down, I/O is held on the
> head requeue list until a path returns. With ctrl_loss_tmo=-1 the
> controllers reconnect forever, so during a long fabric outage the I/O
> is held indefinitely and any process waiting on it sleeps in D state
> until the fabric heals or the host is rebooted. We hit this on
> virtualization hosts, where a SIGKILLed VM process cannot exit because
> it is still draining I/O to an unreachable NVMe/TCP target.
>
> There is currently no way to fail this I/O without tearing something
> down. Deleting the controller (or letting ctrl_loss_tmo expire) works
> but takes every namespace on the controller with it and requires a
> manual reconnect afterwards. fast_io_fail_tmo only arms on the
> RESETTING -> CONNECTING transition, so it cannot be set once the
> outage has started. delayed_removal_secs only matters after all
> controllers are gone, which never happens with ctrl_loss_tmo=-1.
> dm-multipath has had "dmsetup message <dev> 0 fail_if_no_path" for
> this for decades; nvme multipath has no equivalent.

I don't understand what is not sufficient with fast_io_fail_tmo? It would
determine the time that IO will fail when all paths are down.
