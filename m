Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277412;
	b=kAOEEHylzCBqWPb5yYtlApsj8JKZIvqfE+M87YzF69eo1fKBReUvuMqOsKEBh+GrHBDt
	 GSvFHIMVPglbRsjhWf6Fk3xvcNL8i+tmT3o3kZrYeaI2nkZJrMCFYKZfJOIddNqNbVdMa
	 /XGf0MAxRtebfe9yhIjhfqsE6juNfiH2WaxGIuA8STVfgDX5ZxMe/5oQ261lQBr6296ZB
	 QB9PKapEGI7AYLG6zsneqZFuSnI65aoGdVDtw7RFlWUTT+Viiy5T0sAYc8jW/WZ2egucV
	 /B8h4B15dIc8TNH/IR2qroJvSYBwYnhnQ2jpcnvkCuWHPEWWniQ581W3bt0oNd2j6fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=hmc/RolTYy7SeBRxKLMjWzilnvA83GevNb7ysMoswG4=;
	b=frBVnDHknxAjt7EyVD5D/7MknXCC5VcO9h45vp1Q9ukRLT9ueH+33pSQj6gSO5IlWo4O
	 e1vSVm71pmV1DUhAme9QdMMtfwmZ3OxWktBf4i/G1H0ZiWBEyEqKDIdmFctyI714JcgSq
	 0PsT0Bv0D37EaZjJ7HwDXH1kgfqfRLhY1VQMOvicP42HayxbPeq15yo9pooMD2nO+wfI8
	 J3ADn7Iyh8Gr+K4S8JfECqADFP7kfijhXSmFRVRzENl/9UFeJUgNR/eRsr04YB+fPNwRF
	 4L8MLCR4wvSeQ+GGJdCruPfoI4Js60NcM18EeaxBaurzXsOd9NOlNJapE2kVtL8gmoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=py2QzJFY;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C68460A260F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C68460A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=py2QzJFY
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so869662a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793277412; x=1793882212; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmc/RolTYy7SeBRxKLMjWzilnvA83GevNb7ysMoswG4=;
        b=py2QzJFYgzOL03zGd3mHO2Bdili8XEZjmTBrfP3m4bXJAzbCdzUnE14wPgfXIR/hKe
         zAtdXpeTk/pgITkJricxOBeRqKkncsIhziwOUNdrF4Nqw//AZxy2uVu7JyYGMeJN48FI
         trZb0Im4c61Mqbor7x1XbyPT/JT2OH8M5BqYP2ShvyUEiWtu4h1h61NvSmb2oPk3XWUd
         KqfWHqesgeqXa/Qhksfi1BxV9idSCShFWKVwLAy8e2qHEm31JHs9zkkyVIImFi5Wd/Im
         UdHQmnMvZb/drJfythss4ld8cwQ/Q9/+VxqcJUUWbduiCALdGR9aa08Psyv3dV11sL4J
         uoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793277412; x=1793882212;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmc/RolTYy7SeBRxKLMjWzilnvA83GevNb7ysMoswG4=;
        b=c1FWzbrcCDBW2BhDlCPvBODzUy0dbYkn73tFm4p0ouIh6HOo3QIId57l0Zu1GkhegS
         AiPMpljET4s+DM6fPDWamcYX5PI7GmECq+SiQfjjo/3v4CPLYBs1U8gDxQO1vEVg+X+z
         mX+ePz+PW77MTkFVtYaCtiAM+B/kVMvPnf7w0Q2mOFHRajrsdB1I0Cy4sFDw8idWJmWF
         Emc6epXlHtXB+Rt2StBaL3gMw7BI2cmQGQvTe7wTgPR7pm/Vs0jg3haOeMceIZz+RQRG
         mhf/thT69YW6h5fx/I6ywjTQaMEZpHG8Wg4DMmP/k7uETMGuUb0vXu+GV4FGR6g6bEJJ
         Qb8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSNt2zAOfeeCi8zGhE9Ucxc+cDab35Gi9nGedUh9n2rJn2C/vc77LdEvV2ZnCH2urNUJln7+4V/iNEoos=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJEvReNvH0Q3WhITV1Q5MVh+AWrSE7OsbmfIFhnW1D2XXOtkuU
	x2lrbqVZc1XuqL7FoTeajEk6HQc8Biww1jEJc7JU6oD5kd9ezok4Nrvn
X-Gm-Gg: AYBFou3iw/Y09Sa6463CV0sp3nL1zASqhTT1C8PQFdpTkxIE7bVR2HxgrR6Zgk2cIT3
	lwhAc67VfeuPoiZohs8EZCAGLySo82Fwh1KfCRCQf2gjPu2jzdvm40LmsqtNRNuvAI0t1z9TMHV
	ijsviUK4R33x+WjqS1HRufkb3x0MWSwnTAtOmKLMmRZBIJN93g+RIs1mXuiW0d7oYhzAWTNoH+Q
	ywlSmdKjJmajUSLASMj5lICAyC5pRHOzzmoio00VY40J98EfRwDEBitfZurFMxAEYOnW9ELVlo1
	/FeFhvRpeqJkTO9+h0pUeRmy7Xp1xKtMykHf9XOXyBV4N9Urygg41RjaI5tH3ma31z0sGpqTwNU
	RCEtMrNxrxESooQ5A6PM8PrSPrg372EMdz2PE/ovH3DnYIFxapJPRanPESWdFcT9Xv5jXlpCBKJ
	A7R9hEJh543pKmhqR5wmrC2viDVz5MdUSXwLyITGE+Er2DKltOU2w8m34rXE4+I+fPDt52/x+uc
	ekbe6eiOir18W2EpHIzHYIWEN6/EieReFUY0l6d8ex5stcat+id6mZ/y0RQQ2AkKO0VSuEAoX2/
	rutHGFQlzFd5Nkz887vo7N8mVViPo9COPEU/dRoRrE6bB3+3PyCKymLLA6ykzg+CQHE=
X-Received: by 2002:a05:6a21:8804:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-3e9023ed955mr3933798637.65.1793277411671;
        Thu, 29 Oct 2026 05:36:51 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc46482sm5225375a12.11.2026.10.29.05.36.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 05:36:51 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <20261029112045.5e7d4317@pumpkin>
Date: Thu, 29 Oct 2026 20:36:33 +0800
Cc: netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Eric Dumazet <edumazet@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <40993B2C-6390-4BC6-B4AD-967518B0CBE9@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <20261029101859.6893f1a0@pumpkin>
 <22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
 <20261029112045.5e7d4317@pumpkin>
To: David Laight <david.laight.linux@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On Thu, 29 Oct 2026, David Laight wrote:
> But that relies on something having gone the other way first.
> In general that won't be true.

Agreed, that is the same point Jiayuan made.

> It is almost worth implement something that retries with the shorter mtu
> to detect the PPPoE mtu blackhole at the sending end.

Linux already has this: net.ipv4.tcp_mtu_probing (RFC 4821). With it
set to 1, once the retransmission timeouts reach tcp_retries1 the
connection drops to tcp_base_mss and probes up from there. It is off
by default, and the same goes for Windows (EnablePMTUBHDetect); macOS
turns it on by default.

> Or even just use the shorter mtu for long RTT connections.

Both of these have to happen at the sending end, which in my case is
the client (it is an upload), so the server can't help. The only lever
the server has is the MSS it advertises in the SYN-ACK, and it has no
RTT sample at that point. For now the MSS is clamped on the path.

While reading this code I noticed there are no selftests for the black
hole detection or for MTU probing. I'd like to add packetdrill tests
for both once net-next reopens.

Thanks,
Yongjian
