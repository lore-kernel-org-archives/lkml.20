Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794535538;
	b=caW9hno8qVXZoxMSg+7SGXcFrykbKBtkLyUsV9hbnDdtUavDg1lIFkEFfD2G/II6dnXx
	 pYui8NvaF2kdbnsK18OucGh49Hu8LKP3k1LF12SACgUzHZPvZBWW5Vx/KDdqezJPovphL
	 pS1SjpYvRZktBHbjBdy9aeR32okQC/yUPp4WKkTbMV4XzcMWYexnYGVhHBOo5p5BHdCRE
	 uFWt85obOo14oQQa5sZz7J/XfX/z5Wbz5rYvi/onJdk/sjbMN1gI7HvmidwwQ+haxosOg
	 Cfn1hedOr+CUBcyxE3x+8aLltndIPfOl8HecZaKYV5sJdvUNxWq2nlbLBMJCmbV3LPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=S4imppLOyvDXcuLb3YL+/0kdZASSKJjGPDiIRvfutk8=;
	b=coBB0aaFvAJ6EB7GSXIVg1q4jH7/X5zsAFNjpUc4jA6el7dGpVh6ek90kWdQZyXl7bBn
	 A1p3ejj3J1/CPj1s6+QsUlShe6Qn0lx8QwaPYUdINHHSRRhOk/3AJcxckH7+C05JyKwav
	 dlYEvZDkDyCwmqBHneysXKDHMazBraNv38V8k4449OVPjMnZdPubzVWzOztQz7MWWa4bz
	 +WuakJNhmZbbdkOLtu1q+YC9kyb4TvyKds4px1b3HkPSeM7UeE0G/9nfBOsRP3k1yu6iI
	 b9mjrNvS9Dbg9i281eexxHLTkIenavw35XD0uFtH9DNgFCnvIPB3rdmuTDFJ4iQZdvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWnm0WPf;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38961606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38961606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWnm0WPf
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso330422a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794535537; x=1795140337; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4imppLOyvDXcuLb3YL+/0kdZASSKJjGPDiIRvfutk8=;
        b=UWnm0WPfGRw9mYF/UemNGbctgOrYjn3N6rMqRS6w7GWRBITbt48RUqkF3EyLr15NR9
         KrjA20Ej3+31Aw+CtesnYsGy3+zt317COTexb00voSesuKJXUf00ErPdB08gaPIRgAc7
         LR9r3mg4xLKXXdZzACaJgOXeB0A5MKY2vCb2HQwahmS+Xk3FCnGWkNwV+Yon8PEFovXK
         QjjK1SYXeDpsYYAcCkuHTXpfdmBY/rjNzl/vigvsEijkv+/dPrsxQfbg87w7Do6RKTUL
         5VH8JdtEy8/f/K1N+fDuxHWN6Ymhqm4gcgHzVFh4KcyQ1NL0lPJQUmLBGTnD+HQ90LkV
         2S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794535537; x=1795140337;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S4imppLOyvDXcuLb3YL+/0kdZASSKJjGPDiIRvfutk8=;
        b=SSJAfPUyM0k0goFBaZl2Wk533NeaOgDbdgvsojfyrCF5MzKpCtzAFGhLw0q+gzL+9U
         cm4GCj0GcFPh3O6vaElJAEs8auakDx4nI4YTe7WIZol/oSVmLISdlyhTF0Z8KnE5XsMB
         LApS9YULvLpTzjX/sXuojQI0zg37ULT7582FKf4qXo4oP/A1AF5AedhUQzK5dXQni3jk
         gD5HmiZQm0oQKXCzf1Jov2a6qZeU9YAm62luCxjlhM4mQKcoACF158SHMT+laAmH8Enu
         R+JnJt6YA9I988JmYUKtcA2E7s0Qw9bF3Zc79adaRR/8iE3Uff3/vFlYwrLO+nUrwXDT
         P0YA==
X-Forwarded-Encrypted: i=1; AL+hErG+F1wUMdMB5l73Pu3H7yVaEARD0AUBQnkkewioQrUSaEYbTXRlR9Aljh3yb7q3BYRutbDXTYA+7tMMWdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+izmE51CxbpNkEFcBu/NVNDnGw+sSoA3GWKG3L0OjjHsa1y8os
	mF6bE9vGGMSeTKFcPbYRwnLonTa0YCefhsAihd7WxYfAKOTk3MgXpfOY
X-Gm-Gg: AYBFou2qOaRY6qCrn4v7w+D6APki5sJ9ILsPlJAfbUMTP7ai63gLiRz++Q6zMGx0tiT
	cBG+j+aFlLxmpneY9WI0S0S0oUg5F8SjjSbyzRZ6oilarcuIxCd0nzwFbkA3aadpBPgQdKN0MVS
	XcMOvpZUeMeeykAzYMzBBGN9WKUy4WdlhmPaRhV0bkL1VwIz39GJu2ln1yNXNSgiS4V33DJEx8v
	2bim9bIq8eKQDbq2c6MZG4yQTmCJaIm/Z+ln19cKOHm5sHn2GzHz++WfTDkZ70JK841iUwbFsKC
	oB39rt4o1AiYYa9fM+5k+0U7Gswq0OsiE9U8AgVdd0wqg+UpNT/icaxCb81MVsE3pM0RT40UBO6
	YOWEj8Rc5Z/+rviR6fK0BcnKOZBG1eoyOTFN1dzatB6Nz80P7nHozqBNGjY/QkYFf+FRYtUqKE2
	1SUn+hCEtOkKn/htuPY/gXeEW/kru2If7iQLxZv6eiZD+cnMX2k0lSSZP3EPwz75Y6I7Ym92C4n
	+kG8KL6ygzOO4pnKK6ktThKVs4LRKH7Y2Ntoc8WM7IKirqBUXc7kP3Ood/OXjOLhI0mi7v2P6pH
	EyW6D/a6GCUZsp7ytFegYlW68ykI/UYfZf5JPYRcED2MxtqUnrKLzl/q82AdpaC7Xn7cbw==
X-Received: by 2002:a05:693c:88c3:10b0:36e:4aaf:6c7b with SMTP id 5a478bee46e88-3796740c786mr885305eec.39.1794535537128;
        Thu, 12 Nov 2026 18:05:37 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm2342174eec.17.2026.11.12.18.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:05:36 -0800 (PST)
Date: Thu, 12 Nov 2026 18:05:35 -0800
Message-ID: <5a9a39b3d7b0e7fe0b1924fe0f97d14b@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Miro Kropacek <miro.kropacek@gmail.com>
Cc: geert@linux-m68k.org,
	schmitzmic@gmail.com,
	linux-m68k@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
In-Reply-To: <20261021022336.2232886-1-miro.kropacek@gmail.com>
References: <20261021000338.2160223-1-miro.kropacek@gmail.com> <20261021022336.2232886-1-miro.kropacek@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Oct 21, 2026 at 12:23:36PM +1000, Miro Kropacek wrote:
> Kernels are built with -funsigned-char since version 6.2, resulting in
> the signed 8-bit position deltas reported by the IKBD being
> misinterpreted as unsigned.
>
> The hook is handed a raw IKBD packet, so take it as a byte stream and
> apply the sign to the two displacement values alone.
>
> Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> Cc: linux-input <linux-input@vger.kernel.org>

Applied, thank you.

-- 
Dmitry
