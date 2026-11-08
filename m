Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794144551;
	b=ksaGS/gEQjxZrUGWerauv2UAcjFl7wO6JLPuo8YLGSwa7qlS3VogfnJDMvLtjGBzIAn3
	 4OQjP05uf/wKUEkMjHTRszHBPUQ/LqCNMIH+G0MBMa69C4RfTzgv/zocNtb8bV+PvWUf0
	 Hj1zFLCGFWrmvCb+EC9D/VOeUXbuAmcr8Spt8AT5r2es/eYijgrWQgWUWtx30ZRWOCxH+
	 gg71EL0R4/CYrIY1DCrfjDD8U30WxdB4ekEaIFIGWNELDbAio6mkJh/qcf0s8wFOGwRff
	 vg2r0CV7NxsvWoF4ey2TS046oZ2au9tU+ksTf2+R/6AttuasuLti/TcI7M6WUv49H3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794144551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lRccb7zFXAZRlpy06P3LA8/Kjn5v7zQ+e9MSG+eMWK8=;
	b=poaxKLZVtyXlZlQXkNQgGfMNTfpcZuvhgPusNbZS1dIvi1sH2LgIH2pocBmori7A1hkL
	 tNNErfZ9cagkBUZvsV5fxWPT/G61WWjZtaf/RBwOMCHLUL35b5ho5Utjmt9hSIcCBiq07
	 WRd3OgPY66XycS5nRC5sy3lTmjbFcbcS5mh2XupVUT6wE0sFtt8tWRyntCySLa8hnAg9u
	 qqo77ss0Ob0NztHkNZ7mMRNUok0zqz+hqE2gEcj2C49cVvV1wqbFKly4mbL+ASAnFPstT
	 z7N3iGn694mM099o+vcTD4TMbsZtXuWRspZhD48v4XSYmF3DFnaIuUbla4EsNSYEqLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=BsxPqebZ;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD9606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97AD9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=BsxPqebZ
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ec2d42231so1147526d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794144543; x=1794749343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRccb7zFXAZRlpy06P3LA8/Kjn5v7zQ+e9MSG+eMWK8=;
        b=BsxPqebZhw4rwrPqtv53XeehDB+Qy+5VYjNtjlVtbXzKrNFs48pKsl084nQv1iDXcG
         Viz95t6gEbKnMnY3HnxYdZRsCNtzZyWwFHmrJ9DHWP6tjv0sfeZa/DOL3vJD3tnjY86y
         jN4EdwZIQIDX66WX+Mcmorc9xgAqG4pbEfd8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794144543; x=1794749343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRccb7zFXAZRlpy06P3LA8/Kjn5v7zQ+e9MSG+eMWK8=;
        b=WGT7gNM3hmSEquzNihlgjaNujZ5inNg7SLAxxTGabcgnSeR+wPYEHh9RZEfwtnJKKv
         M8KbvkQxm/onStH35jHv7vf75F3Vld8KfsFr58uZFjzhfYx0ABjeOpWh/nCxrNZoqirn
         I8r6+frPlGEjHwKrfrVFGayUm/FB+qZy60d5GWEP+I+G8GkLwRBAXPocLdmo/BF4aoV2
         sF1S1z4PL60UFNbEZEvuS8xyYPtNlxlY0Tt1d71xlrvFXH7JudrMiKCMOk0Chd1AU69Q
         pEqOCh8o8b5c99C2lmOsyfbaekld1OHM6Jz9sNF7QV2PsOZ6EU0mpRE8o4r7/ovktRxI
         B1rQ==
X-Forwarded-Encrypted: i=1; AL+hErH/EJ2OkUXXpuG8/CcNHoAvJ98/kJOXn0nXZ2U+SU64KFcVtpRw6TctfnFZV++R09EXDSuZgJk24ZbKGyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cdL/XB59FSgb0g55y+eXwtSvH6Ky7Knu3sEBEXrdt5E4OrkcG
	YjytavJRcqAzRLNH9kln0IkvhIE/RyYg3H2NzzpWBr/jetxikY0uMUciv7wm4orQoQI+3mFwb4q
	dAgcuqA==
X-Gm-Gg: AYBFou3Qr6RjTwoVtHn/cNtKKuW+q6JY3pAvsgsHHMipciupTenyDsKBk2RMZd6q5E7
	6qZMyXGCp8fXa2DZ/mD6wRZVtwRfE8lkGNYpusATd1/he5yd7hX+bKjdviFTKzPrxyp4Dynohjs
	rbZliCR5+QtcczHC45fRnfOZo4HwdU9vrj6643JMYIZTckZY+yRb5XLxib78ncqaN2O0KRkhrDB
	qVJnC/44KZiU7A1KBkj34gAb73h4G21hzqWqXepGTKp0tSivGDOIC4bhUJ0GNy9eq0rJvK/4uq6
	UO1lcodb6S01q/Wjb3xzbmibAMuq0XLtxSxVBiXNR71EaAfBrUxBFb+9uox5I/PYcLRegz2fp7K
	7CrqSxTFt9hm6+gyYUOeD7B81v+LP2SjCzYOSjSL+U0GXS9RuahSMIdIUT1xEaSxU0IRA4gzu/d
	IzPtzKACsfWCLlVHmpgNf+clDRSXUmfpR3HVddRE2aBMvPwt46ReYgn+aAwklNeKzsEZRhcwQD2
	gGr0z6ZqPLbCzitT2/ah6DgMtEHM1qtMSiQ+tmJDSo0rtlEnd19Myf2KFGC6RcPqds8ULgzGALE
	oTh3zfsJctWTvQzz61Wr8h24PrrXalw=
X-Received: by 2002:a05:620a:880d:b0:939:6dea:374d with SMTP id af79cd13be357-9478474cda4mr191133785a.49.1794144543434;
        Sun, 08 Nov 2026 05:29:03 -0800 (PST)
Received: from [10.211.55.5] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-94782ccb826sm208255485a.6.2026.11.08.05.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 05:29:02 -0800 (PST)
Message-ID: <84720345-3fc8-4320-8bd3-ca23b3c9c69c@ieee.org>
Date: Sun, 8 Nov 2026 07:29:01 -0600
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
Subject: Re: [PATCH] net: ipa: Fix runtime PM reference leak in ipa_remove()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 elder@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com
References: <20260917115115.2149796-1-vulab@iscas.ac.cn>
 <7509f005-709d-46d5-8554-b9d2fd0cd218@ieee.org>
 <20261108102500.3182111-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261108102500.3182111-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/26 4:25 AM, Wentao Liang wrote:
> Hi Alex,
> 
> Sorry for the very late reply, and for the noise.

Sounds like you learned a few things:
- Always base your work on a recent published branch (like
   the latest Linux -rc, or linux-next/master, or whatever
   the maintainer prefers).
- When using tools like your static analysis tool and/or AI
   assistance as a major part of your effort, state that with
   and "Assisted-by" tag.
- Pace yourself on sending patches, allowing reviewers time
   to see them.  At least one day (so people anywhere in the
   world will get a chance), and more (because people are also
   busy).

Consider the last point especially true on AI-generated content.
Take the extra time to really review in depth any change, and
really understand its effects (both locally, and in the broader
context of where the code sits in the system).

One last lesson is that a single apology message to anyone who
might have been affected by your messages would have been fine.
I got three, and they largely overlapped each other.

It's OK, but I'm glad you view this as something you have learned
from.  Keep going, but keep improving.

					-Alex
> 
> You are right that this is already fixed, and I should have caught it
> before posting.  6b9eaa61ff2df ("net: ipa: balance runtime PM reference on
> remove error") makes the same change, and it has been in mainline since
> v7.3-rc1.  I rechecked ipa_remove() in the current tree, and that error
> path now releases the reference:
> 
> 			dev_err(dev, "Failed to stop modem (%pe), leaking resources\n",
> 				ERR_PTR(ret));
> 			pm_runtime_put_noidle(dev);
> 			return;
> 
> so the usage count is balanced there and there is nothing left to fix.
> The patch needs no v2; please disregard it.  The patchwork entry already
> shows as not applicable.
> 
> You asked how I found the problem.  The candidate came from our static
> analysis tooling, which flagged the missing put on that error path.  I
> then used DeepSeek and GPT-6.1 Sol to audit the finding and to help write
> the change, and I reviewed the result myself before sending it.
> 
> What I got wrong is that the diff was prepared from an old snapshot
> (v7.1-rc4 based) and I did not check the current tree before posting, so
> I missed that the fix had already landed.  That is on me, and I am sorry
> for the review time it cost you.
> 
> I am going through the outstanding feedback on my patches by hand now,
> thread by thread, and will answer each one.
> 
> Thanks,
> Wentao

