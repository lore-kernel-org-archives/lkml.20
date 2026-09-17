Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498D6344031
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610265; cv=pass; b=Q0ao0VHJQhNP2iwhOtPxW6lMzpFDo3IvBT+prFGkbJTd2l0lpEu36p9QZDZSphZHy3N9xJiS2i/c0ohT1OemsRHrViZcHHzOMRuVdwrwzAHPJF/kYqAFxYQWAQkkzLntKqUucW/gYlykB7LuuXiQADvYUUdPBzlp80TXjgtf9Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610265; c=relaxed/simple;
	bh=OVuo97XMUoIoea64ilbyzme2krrsLcku+PGv1YrKHIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHJjVOefe4hDkHIdb8DvpjZnRxlamfRilG7oe9kS3FlN1Mfsbur1o2tVkSMPbsRlJnqvrHc7nWb/hR3ZOpYDUsll/LCFte96GcqvqoZ8TrQj8ZHBAtAnpxsm6jDTQuSP96RSko1dBI/xBAofKdfH8zciA6lSHU1y9FngFjPyiyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=IvwhEMby; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="IvwhEMby"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76462aae9so172349e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789610258; cv=none;
        d=google.com; s=arc-20260327;
        b=kaKwqz/doujHq4BvQ5N+MG43nzeK5tUZkCBJjs/3j64cVd3Qs424RJX6e8iFnN421V
         /GvwrUZ/oR6zOwuhQOWlDS6Qsg2s3k8Wg5MR5wi2iIwCbdNjf+yAgAz48r4e4lvVsvfQ
         MKh8CNbdg0QDcdqiv41a0tZcRjKcIflfX0MSMcv1mNmwNjv3CSm77vbGeRJW+EYAKZ4b
         KQzppHSv5cX/v9HzHh/S0ZDTewcYK1x+MQ6BHqw3hzvFFjFADbBT6HC7e/GTSQh/kfU9
         Z8qdxdWCu/xR99YbiHB54PTMGh7IVG0tibR9xFPfBMsPOpqoDGNi0eKUXvPCsQ4sMiqg
         aWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OVuo97XMUoIoea64ilbyzme2krrsLcku+PGv1YrKHIw=;
        fh=YClbOjYgM6MnOo8S6Xa5gjnIOPFl6R3M5PHhkdEuqtM=;
        b=IZOqMP985/4cSt+DFFExJK/MYenwUS74RstywasRnF2B5ewQV8SFdKQB9W0f4/DQ3B
         MaPujINdigrd/4W5F8ljXu2s9iMpvu8HIua+6Z+RZI/IOsrn32bIQ3MHHZTGDMSY/7wN
         E1L5M7GskvFNAQK9dLe5yEZgQiXsMtzoy1pCF55EA8eFm90douOnXVtpAnTJQz/JwPVr
         OiG7p+Hnx+YiL3Kc3HamuOiuzNXeaEK7jIFWBo9orO6jx/oFLJJ8/41j9+Xvgy9MSXut
         si2gQ+/U/Knl9X+UDiC6G3tLAOeDTV8fUlfx8tVSEEeey6yHuPlSOaugoP1Q5lsL49uJ
         ap8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789610258; x=1790215058; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVuo97XMUoIoea64ilbyzme2krrsLcku+PGv1YrKHIw=;
        b=IvwhEMby4OtlMHgVR9TStFBs0e01NjyFym2BEDERnCJgRiV/uzAS/Pl++24MjhqE+/
         AaDvcpfvFk5QKQ3kTYJOqzbC/5voIkAUJKtiRG/d6RgMk+7zdCG8R6JfiTkHMuYM5Rld
         0qnx5FhwUfTALpeakjIYRyFJBrGHwZi6Nx7MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610258; x=1790215058;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVuo97XMUoIoea64ilbyzme2krrsLcku+PGv1YrKHIw=;
        b=KTR5vdprx6Ue9XuD8hXoHnYqwprVVr3Rb/aqDgL5J3FxeAnpCOFotYR2nZffc+stMo
         Llq71NOMWsfVpoT0I1Lq0/c9dyX7hwj+8utrrLj3/BivH+UIHGBY1HFK2ea1LVPYX8pw
         1EEyhgw2W9p2RL0F3RG5BYtFR9PAIW+vl4FtuQeRucIe4yDgKB7PPw8rHoO9MFq1o0C3
         BTQjfpFhpb0RuVUZU1GxWs3/6ZwWHPxqOMk0KL8v/v1QBnqY+I0PTUqKYka8+aL4YazE
         3c4Kq+TIlIU+QYroIv5mkJNvvDtEGtd2hsbsjRG0yhCUbHMY0Z4SbGh4EvCw/s5IsEyR
         wsnw==
X-Forwarded-Encrypted: i=1; AKwUvBwaaizpSsdVavlI6TIMvWYcT3ubx+Mk8b3mZywJm39Ghb321ZvBADCJ8MeeE5eFj5eJsqAIvUoWhmYMHVo=@vger.kernel.org
X-Gm-Message-State: AFuF++lFOiNQiVY5eJJ1AN2YUrs+GFWX5qjaKmu0OdH6RPDhotYRennU
	JscujNCnZjfEyS17YCxUafoUiSrOTXtOVf5UeEIpFinKkLZ8a9I/AelLmKYbqN6MtEQXcokXsxB
	MJeXsQO9+HG/UlBc2BOZa55BDS0AgbJ2HkAkn7GP6oQ==
X-Gm-Gg: AYBFou3BvwBJ/5RvRIv7omZJlLYxDm+dPbXqQyrubOSn91Ll4CaihW8A/PyDcUJbKgm
	ZQmbGYhB1TseKnJVmrlY4Zqwx1Qhb93hBJ+xv37mo+0i96VTGY5fiNZ1VoOMjW8qIn4FTLc2HtC
	m1D5a7h5wROHPqWm/0qyJYx5gjvzSZ3rQjh/7brswoiklltyqJKwKvQgjtNSLbkVvpp0s9a71fe
	xgDRMNp2d2ziAJ7lHGHCuYVVSmVuNA3GD8dbfPpQsRkI+CC29azFjllcfoaHmXEeMsiRW0ATKlE
	ZcgNnoBCk0n5nXLjL3MLgaIJ7EN+xu7ov51A7PJxpDu+vofAn2AY1Ps=
X-Received: by 2002:a05:6512:251f:b0:5b6:4ae:5b82 with SMTP id
 2adb3069b0e04-5b8b6649be0mr1252947e87.32.1789610258067; Wed, 16 Sep 2026
 18:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-codex-rtw-rx-v2-v2-0-f09c964e0b96@khu.ac.kr>
 <20260913-codex-rtw-rx-v2-v2-1-f09c964e0b96@khu.ac.kr> <de086af71cc346d9ac8ca4e7bf8787e0@realtek.com>
In-Reply-To: <de086af71cc346d9ac8ca4e7bf8787e0@realtek.com>
From: =?UTF-8?B?4oCN6rmA7Jqw7ISdW+2VmeyDnV0o7KCE7J6Q7KCV67O064yA7ZWZIOyghOyekOqzte2VmeqzvA==?=
	=?UTF-8?B?KQ==?= <5mghybrid@khu.ac.kr>
Date: Thu, 17 Sep 2026 10:57:24 +0900
X-Gm-Features: AcwNN1WIT0733jVhCBZTpclD_qLBOl00l4tmau6fIT9YXpXIFhaoVivvV1ifv1w
Message-ID: <CAH1Bc_xaD2kjBRp7aVjmAcz4Pv=zK2Tx7ro38UsdZZtXRY3Oig@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 1/4] wifi: rtl8xxxu: free RX skb when URB
 submission fails
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

Sure. Please use:
Signed-off-by: Kim Wooseok <5mghybrid@khu.ac.kr>

Thanks
