Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827C371049
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855677; cv=none; b=lgTnUKSkOnknCJF08ZUaZ0cBsEg1fKDObLZlLWHgHXTUCtIqnVNQbvIBB+SnhfWnR9aymYckbyhlvUML4+9r+4Zn9owHdiuueu1kr6MDdfFTU9tC95MMCuQpgmzu2ivfdMUlkG2+xViTogOnjRbcGkcFrLcbLMNjU4711Sj8erY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855677; c=relaxed/simple;
	bh=xTnrOATJyRY/t1BaZ1/rZxgk2urH6TavcD2eYZ2/x8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olaVQXLmKJKDCnRgwowjWKTgOV/Kb2aX4VxxweF+WEzuCFLIanDdfP5J/HxQiU0Fyap6PVZh5KW3WPhpbfRZJjDSOzwxz1xgGXns5lb/msgfnagu+uTVn5PCx0TaTJL1yDdV6QWlwR7CBUdRttZC4Z9HyP8hkBV3LNnPnzX8C7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV1j9neZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV1j9neZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so29436665e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855671; x=1791460471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTnrOATJyRY/t1BaZ1/rZxgk2urH6TavcD2eYZ2/x8k=;
        b=bV1j9neZpe4L/wJrqRACbO9er+NpmsHxNAzfUYcvMr0sAgLFRQVUoQhoIeqGp+TCOQ
         LrNUBYkbYZKC+9Wkcti741WrgaMIcXvqJ60iqS4zGIHhjdeZ+u/rKHH0BQ4iy/5DEK02
         OJHMwLkGshD8O5RZiy0a89uIwH8JbsFqh/xuUxAG6iBagCy5JaPuuDq47pv+l/WBZ8gk
         tIxGo45+pCtsBct1Cys5+AUCd/pZCQ2lB+8aMex0+zPSUtyGU7ChSrwhf3md7Dv2WZcW
         e/7FS91ium3AzeO5w91ZNVaLGKaNAeqTM26wWirJ9lJ8zTAuFPgJ8WLQNuqZ0J0J5nGF
         CvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855671; x=1791460471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xTnrOATJyRY/t1BaZ1/rZxgk2urH6TavcD2eYZ2/x8k=;
        b=cae5XrOb1Sk/vFeyabwFlKpHX5AuJbaucbthoHK2+0M4a6vB9+RmcHjjmH1KfuMzb9
         BGJLjrMaMa4bFYp9wGShJL0kzZWw8h868mgTPnsXeicBd1uTBjZQSuxEt3NzPakczHi7
         LA9hGRzxkboFBqKdthE4iu3dCeS21Frg1v73YOlK78eaI3B8xp1lGkeqtNVsSy0vUQUC
         z7Ljhz2VAp4AAyjJ8dHc4xQbEyFXlQh4o2ivy5YkBiO24MIFQRzDJ9TCg2Gkfsyotude
         327kDg1CLs3jsZORCkYMv8rotyFsYdldnwQ50+CeyxmL/Pyqinv1p4Ifsq1FesmmtMk4
         Wqgg==
X-Forwarded-Encrypted: i=1; AKwUvBzSt5TYwTS5whVTzO4AQZWFomfjBBrkT00DVrkkK0b2l+kh9eHgN2Kchtlc3MZWpHmwEj4WD+QhKr/5ctw=@vger.kernel.org
X-Gm-Message-State: AFuF++lHTT3d7i30h/BuIKkzDh4qxzkwlHBR1TEQiR7kQVimsr1RALtO
	K1EozSI1ag0qCMhGza9M1VCBO2l6kvwauJNXP089jgOjQyX77YMxFqXQ
X-Gm-Gg: AYBFou2TG3JYai7xrCWdAMlFtNwloJaFgFAR84cJtOZ0UnDYF7qiNmlctxPuzlK6Nk4
	kuBXhBjELF3cuJgFZ13nWiVTVdI5EbRWM+Uvpsd98Xjo94PBjvpRcm1Kr0W656gniBqKT4QnrBx
	rJwdXZg5ZDZ/6CLmlhgQ0VkKGcxWvdl/+2MHfyu1hBxBaAyM6uPNLKEsqoT2RhwjbG4MT+hqwLg
	DnfI3SFjb+JeKtgJ8Fc9HSehnfRlWZ+yjpi+sIV7rEJ/b1DDFfXvyOhos/WsFNwTurIdmnfaFNK
	UB/Edwg0FcOxZYkX0SsHhOZ1ZDHu1m9xT3fh3bnTzPFNBLyow1cq6RNnGjQ5rP6cBpVtPHjDN+q
	NK4RDEp5G62Zaz8zZ/Bzru/DJgGbTKlpE/e6E3Nf3VwKvdetbnRLabckaG2pBxCj5P8gEAMLDF5
	rjnrhZ94SjxISlO2WfWcz7/0sTPjxYlkhyY41t3nuuJBW/bMyFgClJOHIG6mutx4WDDNueImNTP
	4Fm8SQYn91mowM=
X-Received: by 2002:a05:600d:864b:10b0:4a0:2dd:7573 with SMTP id 5b1f17b1804b1-4a01b12b666mr53819085e9.33.1790855670520;
        Thu, 01 Oct 2026 04:54:30 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f220sm68289915e9.5.2026.10.01.04.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:54:29 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v2 1/2] wifi: rtw88: download the beacon the reserved page was built with
Date: Thu,  1 Oct 2026 13:54:28 +0200
Message-ID: <20261001115428.2979730-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001071656.16499-1-luka.gejak@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

On 2026-10-01 Luka Gejak wrote:
> beacon is written in that branch only, and the caller declares it without an
> initialiser while the free at the end frees whatever it holds. The first page
> always takes that branch today, but the caller cannot see that, so a later
> change in the build would free a stack value. Would you mind initialising it to
> NULL?

Yes, v3 initialises it in rtw_fw_download_rsvd_page(). That is the only
caller of rtw_build_rsvd_page(), so nothing else holds the out-pointer.

> The cover says this path is compile tested only. The feature comes from the
> firmware header rather than from the chip:
[...]
> so another firmware for the same hardware can reach it, and this is the path
> that v1 got wrong. Can it be run once on a device whose firmware has scan
> offload?

Agreed, it should run once. The feature word at offset 0x0c of the
firmware my dongles load is 0x7 for rtw8821c_fw.bin 24.11.0 and 0x0 for
rtw8822b_fw.bin 27.2.0, so neither has bit 8, while rtw8822c_fw.bin
9.9.15 carries 0x1e7. An RTL8822CU dongle is on its way here; v3 goes
out after the scan ran on it with the AP up, once without a countdown
(the download must keep the beacon) and once during one (the scan must
be refused).

Best regards,
Mehmet
