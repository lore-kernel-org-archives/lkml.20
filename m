Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9C7214A84
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218211; cv=none; b=BPwuuWVzHw6Fnc7acm9mZMueFV+KZ6FvtnPksHuMh6qV2hnVddU5lGBNmXuICl8dul+OBD7vKAfXR+Z7xQZhJo4PVo7AXdT9I5oHHU2GRgt4zYzgqG6L0+3YmchUBwzXzivvnWnaHLvvQtyhLzv0amhFsbCIXdRQbZN5stJmkpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218211; c=relaxed/simple;
	bh=9e4PQ6uR1W96HeIsp077zE8P0NKBLmiCNZJI3FnGgyE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=IwEzuR4gS+/gAUi2BHVDL9w233KXqVv3vOzAvOXFGrkDS2JIluZEqvVBXtVR7gNzmjRS89Z8YlThBEq+LNzCLs8SkcfNfLOEIajK10CIsO7HwOssw1sL2OT5TFRFmvoFFhatbp58mx280iTrGKxvGtu8k03rlUdUkaVU+NP3xxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJ8nGTcb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ8nGTcb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so13505635e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791218208; x=1791823008; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9e4PQ6uR1W96HeIsp077zE8P0NKBLmiCNZJI3FnGgyE=;
        b=iJ8nGTcbtaPTahyX3kE5FcPTvcBBDc0ePUDnXLzYd80P3aUWH/IKRmFb0vLTM1xm7Y
         eTW17E0kOz/HUcGPL5JypD8G7pVOE6e5z6oK/o2xmae919FAfq5mn3LZmkK0xapzcrha
         GpIzwPdheklTQV/UjEnd2H5lyBpL1bU+Qani0XTjWfbajBY7PWcwxtFdRBjz/BiPSsUP
         pbda2JB7dFINpvVAjPvW1MQtO2k6deaGzXAxcSX03pn2+X7gEoJTb9jE5cBNwElKMWWI
         vyX6R+PiTMdsg0N3lj13WEEsTnPQma66lu3nkHf29KZEmuX5iAI8qznT4nxKDUk05ODL
         bkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218208; x=1791823008;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9e4PQ6uR1W96HeIsp077zE8P0NKBLmiCNZJI3FnGgyE=;
        b=uG427fS6Nxv5vXe2AXq5lQCJ5pYNVIjMRA+65DO+61wGqmz77kCtDBdg9elpc1PMuq
         tzyJ2/rD19V2YYQyF+59CxsbwZxeOVnTRA+7Ffps+4CAl+nCwCTLAcye9zp3vWZTEAKz
         CdgNJWYSezfOttb5i6bwvNNp0hW0fwTmQpLCz9skNGafjngWYAnON1GF1GVNEwLBqWdx
         BHnPMQ6RWjpQ5qBHNorEbfacjHwmCZKF5BLQVzoZzkIcXjZ7G/vcUCKCFu5ciYZw21Kz
         DXu3f8asPhXkQ6gTgbfEPwX2T/2nVA6Bm2mBjGiJo3gSD2LJLpQRDgP89DMtY+/AdHTv
         lLag==
X-Forwarded-Encrypted: i=1; AKwUvBy8wA1w1sL586PAg/Vbaf1BwNOLeLM+LFE3ks/mXwaHyNWhNlpCMNbRRghI0df0306dxS/jkJX5Qzdj360=@vger.kernel.org
X-Gm-Message-State: AFuF++l8yD8vuwev6B68iH69fE88UfW1LJk1UgpaZLsDhgHXbtOGmlvy
	uMMmTDjaYD+AveCXBwzcGS6E6u54Z10ngFvXIe3l+rG2XAwFA8NGTWuw
X-Gm-Gg: AYBFou30Sef3n2QtdCgjFaazkR/MFQ08tFMbGdsxJJDmZB05E5DoIWfX6caQc93quq7
	KUqckK/vhSEfDS5RtDBPkQD2ec9UnQ38V85pyReWP2a5jk+N5sC7y0lNDwPRIiiePrsCVHrcQ6s
	IqFZpLDDacxdD7hGFO7FyJKAF1E9GvsMQkALVAs7blK0I5Q5PobKNo9CVN6hxmr5zgis4QTpR9B
	2XsTyxug7iecdYMjF/3DNyOUU2q0HEG41/Vuf6IOvFrqUcSgW8pii7StKwzwf2T69opcpfVIfTB
	pHmlZnD9SWBKWzHJVVjCqB6dU2/91uuuIUunOekgGHIepT6ICVBZ3iRg6/T9SObaC0pgFTizsPG
	3gXVVVosZFm7i+H1RtNNk1W+p9XlsemNlyigKbvh+hmZMpt4bl40f7JX/ol7xQt6Hv872vvvm1R
	WnKJx4MFVptzdFKvc+WkRiEGznaBHIvFCl1m9n8qr2GjbhNDYIYOMJ6B0oNAxjcNmzXiEg9pqns
	xh7Pn+tL4MwxS2QOhBURecUU531x5A37jehogddnk4s0UWqpxWPfQ==
X-Received: by 2002:a05:600c:1394:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a02759dc21mr208024495e9.31.1791218208068;
        Mon, 05 Oct 2026 09:36:48 -0700 (PDT)
Received: from smtpclient.apple ([141.226.89.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c3324bsm4414605e9.5.2026.10.05.09.36.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 09:36:46 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 0/5] x86/mm: Allow preemption while waiting for kernel
 TLB flushes
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <278e53d1-e0ca-4886-a762-ca98d1a21a69@bytedance.com>
Date: Mon, 5 Oct 2026 19:36:32 +0300
Cc: tglx@kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 luto@kernel.org,
 peterz@infradead.org,
 paulmck@kernel.org,
 muchun.song@linux.dev,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 bigeasy@linutronix.de,
 clrkwllms@kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B1576E3F-E75E-4EBD-93C2-65042017C78A@gmail.com>
References: <cover.1791179421.git.zhouchuyi@bytedance.com>
 <3520FAB5-83C3-4116-BF19-87D66048D993@gmail.com>
 <278e53d1-e0ca-4886-a762-ca98d1a21a69@bytedance.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On 5 Oct 2026, at 10:48, Chuyi Zhou <zhouchuyi@bytedance.com> wrote:
>=20
> This keeps the common descriptor and threshold policy, while allowing
> preemption during the final IPI completion wait. It does not yet
> provide the broader consolidation you suggested, but retains the
> existing stride_shift field for future kernel stride support.

This one looks better. I=E2=80=99m not pushing for consolidation right =
now,
but considering the complexity of invlpgb, TCE and stride handling,
I think it makes better sense to look forward a future where the
kernel and the user TLB invalidation paths would be unified.

