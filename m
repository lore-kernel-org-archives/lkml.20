Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA444B68B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459501; cv=none; b=GqZpW+K48+PMq+Yuz/HQknhKsqikdiF21Oc3yr/fsgURDzO0jma5TofLkd7wLQ24cunbtNWqTGsx2yHlEcvGNeysTTSuojvGatvKI4wYdwWhF7W/AF8Rq3IEiYJ7v5MLErMSqfbQPPyFWADfJjNIAVE//0jxgGPxXMbpzR1BRVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459501; c=relaxed/simple;
	bh=9e7W2f6a3jz8YGTOd6N82PW0wtiqPYTCubq/Qgl0fLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1O7U5hn/4zpmlV9i27bLZeb83eocbnoZZojx/iZ5esCaqZVh6XDlNSRVIk1OO/EOZsC/SvxqF9gFnf2JEoYX81DTm4EGu5QmWMKCt7I3/vs0XMMr/4XQMkEnwucx1ZCguF+8yaXFC7ASzyZsTz6afFKU8BMsfeQaK1BoMxf+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8XPJuhL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8XPJuhL"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e608cd460eso11493675ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791459500; x=1792064300; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9i/+azlZLZIzmsgzlfAJlh5HU5L+X3Dl1o5h/G5ZaiU=;
        b=g8XPJuhL7dgS4teR9JbxDxXm0RpOZjwXlvgP1eohhNIJFTl+fA61jgcy/N+bFNXMrp
         MXSYTGtc378dR8MRHcGKYwfDsFJnEf/oac9mIQprw466khBgOGXJbW6sORymSOJ5ReSO
         xcdZW9TRxniPA/DrP4dI3FfQ/fkp3k0zeMVOZnzsf2KpKEcQAOBFmuaY6y7I5kwvUZkY
         C7Ee2UUPiFs1163+Nv5uZTUJce4kZ0gwoz9LK6qXiAzG15P7vni/uwRK3/HEz4xPyVT4
         ZyUnb7E0Ref+CW6L3jnEEXWa5rhWcdQDn78wUuh3bl7mHnAzzIkxPJgW9PUmKd6saH+E
         92UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459500; x=1792064300;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9i/+azlZLZIzmsgzlfAJlh5HU5L+X3Dl1o5h/G5ZaiU=;
        b=vZ9gu/G6HXNn4SU5itHGkTUV/RAUB+VXnYIsR/HDIwtDCHynqcmqqyKCf8+OyjUEPv
         5cpbShfezV7P1KnlTLDIeFEpo5cXMvASTIzbt82mVg2SOkTEjo9sRMd++3+SxaKIqHkK
         YjNfNahL7cVmHOu41eK1VGpkAHwmwmo8Zfw73aSQWIw33xHMPl78+7nnlg5+HnMdGY4E
         xOPmCzMnHzUWJBriCx7s/9K7n4QaII1UXHxp3MFTYxhgGW/yYg1W1kBIEqzDOk5Ia/E8
         DO01lXyRGiIXP0OSCfNTO6bwwb7tmM6VYP2uIHPnA8xgRbH9pWoMZ9i7J5tm5cOWa1aB
         Wbqw==
X-Gm-Message-State: AFq9FYINMAb7QZg3/L6Km4RwTLVr5aImZuMkeCzp+mMp9d78OsvtlULi
	ExasYk/gUrq9p9NASNcjiVJSWhyCE5t3kZcA4fyxZzUk2rkJa7uVHxZVP11fLiY1
X-Gm-Gg: AYBFou1EnvRyZLjDOwqo4sIP8GdjkJd0bPl0rJSir0lwcK8Hadg3D2TpX8roKVAYJ4W
	kyU9BcoK8qZxoBa6WTXKT5rWiwZ8rIYvW2WYq9jtqSkjAnK9gnrWod711gTKuKcPvMIcIUb66px
	BGKwrzhVQ3JQqaM6jBEd76mg4oQOPtnlTt5MW9LoPmd5iluFh5II8BglhKdCcEx7O8jZ53gQnRs
	XjQU/xX6jJHZ48NYdWCvay89MkWWe7V+lBW3PutUnMD3oxEhAwPjAcqIm97aX/mkcR+twyGAgr2
	4nc1OGfs1zNmTneNuUyMAPoGtM2z8rcfN0LEriO4v6zTv9KbxU6YNocecABTGKSqdty5998Gcn/
	w6Th6aCTLlZT5+8py88rbOqAqE+o7noZVCBnicHcPD3cJUE+StCIuLhM4AQVlNYFw8tGLEZdxZJ
	GJVJrwrt8caRgszByAZqrA8IFgq41MvslwVDN17aDFhGHU4k0Oc21W6JNPmHqgnWPbityb
X-Received: by 2002:a17:902:e74d:b0:2e6:13b1:e196 with SMTP id d9443c01a7336-2e613b1f621mr35425745ad.74.1791459499719;
        Thu, 08 Oct 2026 04:38:19 -0700 (PDT)
Received: from gmail.com ([154.91.42.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm22616365ad.50.2026.10.08.04.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:38:19 -0700 (PDT)
Date: Thu, 8 Oct 2026 11:38:13 +0000
From: Zuo An <zuoan.penguin@gmail.com>
To: linux-doc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] docs: ABI: sysfs-bus-usb: fix typo in path to interface file
Message-ID: <aseApS_MWoP3Jtp0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A path was misspelt with the delimiter between the USB <config num> and
<interface num> as "-", when it should be ".".

Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
---
 Documentation/ABI/stable/sysfs-bus-usb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-bus-usb b/Documentation/ABI/stable/sysfs-bus-usb
index cad4bc232520..400237db166d 100644
--- a/Documentation/ABI/stable/sysfs-bus-usb
+++ b/Documentation/ABI/stable/sysfs-bus-usb
@@ -60,7 +60,7 @@ Users:
 		PowerTOP <powertop@lists.01.org>
 		https://01.org/powertop/
 
-What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>-<interface num>/supports_autosuspend
+What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>.<interface num>/supports_autosuspend
 Date:		January 2008
 KernelVersion:	2.6.27
 Contact:	Sarah Sharp <sarah.a.sharp@intel.com>
-- 
2.56.0

