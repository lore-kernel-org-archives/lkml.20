Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67BE155C87
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180602; cv=none; b=sGa+QG24bp4AoJDY/fUoG+YZDc3014fmCwp0FF43OcXoZAsyZIJL8X/aEdhw9xas9yn5voC/CqQWMs5H3Q2CEAR1h9l9068hyc8new43qvTf2aC/EYbvykubu2bAwjysyfb234jQQr6H3/AICnxWuvz2X08VGIxfTXEr3rYStjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180602; c=relaxed/simple;
	bh=AC/hjKF1VPu1YX1L60ydQLw3GJ+ZgbFwpNxSQpnhjbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9JUjLXRa0Yoo0YiZ7SnqpcyiFBwyldoI/JtZXEjpsUuLx/bdUTDpUvhuDCwglVgMnNhkLYqHQywIO79GkSF04XvZuD6fZrrZX7QjthTnZYbxDxUr5XsmgEgDv5N90plNoAWZVbjyNunNDzcXE+NoWbCoDevADqynVWaTD5FDGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qh7/ZA1q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qh7/ZA1q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso2798515e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792180599; x=1792785399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AC/hjKF1VPu1YX1L60ydQLw3GJ+ZgbFwpNxSQpnhjbk=;
        b=qh7/ZA1qt/a0YB45XLfnj060I/JCSR8PMB1qW/mbltHg8YTETUqgepcGPFmMErhPhB
         z3HdGbF+ryUeKyT/plG2SIP/g9MXZtH1mzZC/BMlWLpL8WULArqN4W8G1qdUs3SNxqHy
         EIm/xTE8JbVUNVc2h3sZ7MkeO5Lx3S8d0kYpmZgYa4iM7d4viZNFdbidrISmolRa0uYa
         H8G65rr/fB59Wivm1oMHbC2vDZvLcnqsCbVWGv59hv2yMaz+0EyV7URpM5tODZ6bAZsZ
         VPqLB/uJvPjN8/UY4aBqYrjnc+cg0QjSTNL/fAKyYSP7KOmbZC4Nyusw0GnsDEY9pW6a
         3JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180599; x=1792785399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AC/hjKF1VPu1YX1L60ydQLw3GJ+ZgbFwpNxSQpnhjbk=;
        b=h/C2mxzubKHFVnwku6Kdx7atmfgR+Ke4HdmyI/EE3tracBrt5uxjJqNwjmeE8JtJ8g
         fej2UzdYSTW3b5jJ8AcFSgMea6sof4/Fyzz8nR6srZWrTHpQp4OuQKrvgiMW96J0Bc8Z
         meU9VrqddyYhyttOze+oGR/qG2HyVXgk202og0LF1gvyhQiPn5Qt9zT8ZsFzte5ytkrP
         /c4iK4LIw0Ki7BD5vcViD/U9A8iJc4pqeprbmEIGgQglGMZDlpNvkXqD4u28amsjGgVj
         1x++n0RjX++yXoEq5FkdbVisQZGGo7SO8nzh3Y/ACkSb7MPe0mVyf48HoZFiYiU8hFF0
         X0Mw==
X-Forwarded-Encrypted: i=1; AKwUvBzzbQBtGqcwtUbrAv33MmF2t3A0T7MqKNJRaSfh/SEC0KqvKkl1F/vv44VLcQ3DJceaJzY2aO8Aiyfh2fQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxEWo83D1BIwNl2dKBB6FSrawSyIrI5MKavGMk5ulO430TtsHe
	0n3H1GK+9iBW1j1jXcEg/lWRfFENxS3VP9bds2/aX6+TbiVHslS0+I9Y
X-Gm-Gg: AYBFou3r5S0/bZvVeyUJJ0nqsyoHlhZ52DrYr/k5tR9NCa0B9cisvBklz2fDAJHIWA9
	9AfJoCJmRrAh+nddnvkBVUnBH6635mM8tDRgXNBB+i/+aV2bv2iFyE4OIqW1x0IfxEj5RoosSxw
	CHxSCbhvuppcUn4lbj8qCk0VLMHpUF3uXfnrHfh0tfPra0LzUSq2wmrq8iLIpuoFWKWi/g5Kd1+
	xTbWmNq2oXYhZwFuDBy6coVJOEe4Sbr17jU5rZ/8gWWwldXcMRFzvzgpaOJCJgCtdktZt2+BPiz
	iLZh5Ay2olbYQacQeoUDrq/PM6II8jDPkJJGdqYLPwIU0e+4PY8uL6LPMqGkP+xduKXkvHU1VTE
	3Z+wuW1aRxOUnRNWZLyjKoq2Z9AkV8CIW1dZKAAMYBcndTBVFKf9ZmFuB/k8m9SZpWQ0+2Lvi4S
	wNMCB+ICYJjtFqDucGt3zBrT8JwDOtfkar7pTQeW+IgPLFo946Hdu5KApLEMI6Vilbidj6keueY
	BeYl1BBbU/YW1ZZDboom7/NdlRq6nCnejH7+c2z
X-Received: by 2002:a05:600c:3f16:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a1d7614674mr16884895e9.15.1792180598706;
        Fri, 16 Oct 2026 12:56:38 -0700 (PDT)
Received: from ubuntuARM.. ([187.14.227.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e28bcsm7075304f8f.23.2026.10.16.12.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:56:38 -0700 (PDT)
From: Jeremy Dean Clifton <gservice341@gmail.com>
To: syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco
Date: Fri, 16 Oct 2026 14:56:46 +0000
Message-ID: <20261016145646.105391-1-gservice341@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <694c9ee9.050a0220.35954c.0030.GAE@google.com>
References: <694c9ee9.050a0220.35954c.0030.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
