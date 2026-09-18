Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8AC3F327A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750853; cv=none; b=kGasXV2inhCYTbsGhwko4Ui6E2fC0TQdXYUm3SggeidPAP3lpAnyrAMJhQWpsVkVRIrCAzaxeyXo0lrRdnKGbscAXhQGoku+YFczsQAZ1Esz9h5srkHx2ndYk7Rfxm62hD/M1a/drvPkYbGQ2YrTfWvaEYUGrTYnc+O4WXc0ifU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750853; c=relaxed/simple;
	bh=gcX87xrdiRq/JpJfHXf8dc2D+Zg5tedVXGlS1DW/jBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9Lx1WWmDPbjZqh509FhylpjBsLntTQ+T47D+4Yk6NF59qDTGMJgGuK1RR6atC11Oy3RbE2cJy3adsQU+sT2d+lI57lx4vh+d1kuCNrgQZhEUGdQz0Zw3OzJDzwgbsGUX+yPtwVS9NkaCTLlM5HKqXTOtYTHGDeAWmnzk+oF8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpjbLjak; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpjbLjak"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc39so1119761fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750850; x=1790355650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcX87xrdiRq/JpJfHXf8dc2D+Zg5tedVXGlS1DW/jBw=;
        b=VpjbLjakR65SG+Uj0M6mVLb5KJvo3lYjQUsygd5JZHh85k3t2gof/14XDPeu+5jApt
         ocHKF0sNyC+gUH6ChFZhyWG21dNHnNW+oJFQ5Y7RnruwlNxBWILG8diRROfG/IAUIfR6
         ZMUpLR89dhNt/vohNehTKmHzBk56jv9Pq7nvjkBgWSsEa/MaQsbEwPprYs5HGBnI36pu
         MRoM66Hyy0S2Cw1qdd1ohBcDjcvOaixgZFj2/W8yUghQg7VCU70muJ2TV14ZzT5gsCeH
         iqxyrdUIfVjs+Ppo8E6A1hl/V82Exs5n94OgGp76Iy6NqvMXBabJUn2bxn+toiDfhWz3
         inGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750850; x=1790355650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcX87xrdiRq/JpJfHXf8dc2D+Zg5tedVXGlS1DW/jBw=;
        b=aP/KqKnYYIDiiSKdrm59An8Ypf4mr7L6QU/0viVfgDp2RGoqjdUQKSqAoWvmqzwxsi
         s6W2sSlp3kTEP4tghFmvMOCW/9Sx5fbNRQTGyf7HCa4HJpGmjYsHrHhnqAMVe/6IlCqm
         Q5JliOKomDl8IHZT6kWifRW/P8I3jrvMDS1fLT/zARpRumarHWqTrs0KWIXekFjDnflb
         A2ld4Z5EXJCXj9Ip4flQvB1ZtJO/fU9X3RtxBQQBeKGlTjhIo9BpWxL+qzLzHbX2dsPN
         lxoFAXs/xer9qlRRGY65hIkzNLUms8Krn+ExJXFG6bZRCwHv77J/i3wdCKV8NgxJStPI
         u07A==
X-Forwarded-Encrypted: i=1; AKwUvBzf09r+RHoucRshvSAyAOJ8MFHFMn0rgTle33LAGG3i310M1XzB6yS04IQeKJEPVyr3d/mHzVF94pou80I=@vger.kernel.org
X-Gm-Message-State: AFuF++ky5r3P4FDDeI8dOQOiL6/qr75Hh2C6+s0uIVaNtBFeUKDYgqxh
	Jk9KfCFpTLZRqn9fUrV/97MbXNWyS0sqQxGYswHArIIuy/ZXct4vkKOf
X-Gm-Gg: AYBFou3/AU2sT0vYBMLzvENH/dZUnQeoCZLbfnfRv598M+o+KbtUgN/UAn5uEu4vxQV
	P0v2kythT4tiMxYb5pWv7ptV19MTlXWY7QmwyWrMM2nL9LeLcfHeGAedjOSlQuEf31+4PcimXS9
	vW++kuQK3m1O14S7PP4tq476990qUbCJe5njNvU/BAr8T8kL9eAdLlk3DQNthXKs9Vz/iOcfBR6
	Oi95oFKHPtBPf2zucNwUwSl0A/GXgm7gYMEOc+9iSFAzKiepq9X51wwzWGlDVu0zkYk+ZYYDQ7G
	V7V5YZjY8uFMMCl10+AhaO/XE8+M+UVi7NQ2tPqr9mF9v7HQYt6bpxxjNiFZ4yVjaWBHPSYc93c
	5wXWgIZZDnPsBXNe6yQVjpPbwLesW82rBV/hrXJn/tKRxyLltj16HABUkpBFvD75F/CMzho1Uos
	HdlJHvt5r/Qzksq3SwNMmHL0UZCc6HXIATS1Bm9Jku+7MYTwWR611UjkMkfx22UcsQQA7iJY9Mi
	M7olLYkdDN86yUQxzWvCXYD9BHgoS1eyfSoM8yWo2xLw8YlbTe+xSk00eTMFu/AxAr59bb/dxuC
X-Received: by 2002:a05:6871:4709:b0:459:2c03:6302 with SMTP id 586e51a60fabf-486e4f2976emr3735381fac.11.1789750849818;
        Fri, 18 Sep 2026 10:00:49 -0700 (PDT)
Received: from customer.bnssarg1.isp.starlink.com ([2803:9810:8266:bb08:24a9:9eba:f922:f56a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739852afasm1404034fac.7.2026.09.18.10.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:00:49 -0700 (PDT)
Sender: Mariano Baragiola <mariano.ignacio.baragiola@gmail.com>
From: Mariano Baragiola <mbaragiola@linux.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Mariano Baragiola <mbaragiola@linux.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Anton Danilov <littlesmilingcloud@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] udp: resubmit encap packets for secondary mcast sockets
Date: Fri, 18 Sep 2026 14:00:42 -0300
Message-ID: <20260918170042.609084-1-mbaragiola@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAAVpQUAmGAACd1rBomaY-B2vRiE-VX9u4JRCteVB-940RhRtbg@mail.gmail.com>
References: <20260918153604.579277-1-mbaragiola@linux.com> <CAAVpQUAmGAACd1rBomaY-B2vRiE-VX9u4JRCteVB-940RhRtbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 18, 2026 at 9:21 AM Kuniyuki Iwashima <kuniyu@google.com> wrote:
> Did you see a real problem or is this triggered by an AI report?
>
> https://lore.kernel.org/netdev/20260415203624.4057135-1-kuniyu@google.com/

Hi Kuniyuki,

To be completely transparent: this was identified during a code audit following commit 3cb8d4b9bfeb, not from a production crash report.

I recognize that standard FOU configurations do not typically have multiple listeners on the same port (returning -EADDRINUSE), so this primarily affects multi-socket/SO_REUSEPORT encapsulation scenarios. If you consider this an edge case not worth touching, I am completely fine dropping the patch.

Thanks,
Mariano
